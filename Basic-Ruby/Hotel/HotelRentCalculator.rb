require 'json'
require 'date'

  def Date.get_formatted_date(date)
    current_year = Date.today.year
    temp_date = date + "-" + current_year.to_s
    if( Date.parse(temp_date) <= Date.today )
      temp_date = date + "-" + (current_year + 1).to_s
    end
    Date.parse(temp_date)
  end

class Event

  attr_reader :name, :start_date, :end_date, :event_rate
  def initialize(name, contents)
    @name = name
    @start_date = Date.get_formatted_date(contents["start"])
    @end_date = Date.get_formatted_date(contents["end"])
    @event_rate = contents["rate"].to_i
    # puts Date.get_formatted_date(@start_date)
  end
end

class Hotel

  attr_reader :name, :rate, :events, :tax
  def initialize(hotel_data)
    @name = hotel_data["Hotel_name"]
    @rate = hotel_data["rate"]
    @events = []
    @tax = hotel_data["tax"]
    generate_event_objects(hotel_data["seasonal_rates"])
  end

  def generate_event_objects(events)
    if(!events.nil?)
      events.each do |event|
        event.each do |key, value|
          e = Event.new(key, value)
          @events.push(e)
        end
      end
    end
  end

  def occurence_of_event?(user_start_date, user_end_date, event_start_date, event_end_date)
    event_range = (event_start_date..event_end_date).to_a
    user_range = (user_start_date..user_end_date).to_a
    status = user_range.any? do |date|
      event_range.include?(date)
    end
    status
  end

  def get_days_of_stay(user_start_date, user_end_date, event_start_date, event_end_date)
    event_range = (event_start_date..event_end_date).to_a
    user_stay_range = (user_start_date..user_end_date).to_a
    event_stay_dates = event_range & user_stay_range
    event_days = event_stay_dates.size
    normal_days = user_stay_range.size - event_days
    return normal_days, event_days
  end

  def generate_output_during_event_stay(user_start_date, user_end_date, event_start_date, event_end_date, event)
    puts "The stay of the user coincides with the occurence of event : #{event.name}"
    normal_days, event_days = get_days_of_stay(user_start_date, user_end_date, event_start_date, event_end_date)
    puts "Normal Days of Stay : #{normal_days}"
    puts "Normal Rate : #{self.rate}"
    bill1 = normal_days.to_i * self.rate.to_i
    puts "Event Days of Stay : #{event_days}"
    puts "Special Stay Rent During #{event.name} : #{event.event_rate}"
    bill2 = event_days.to_i * event.event_rate.to_i
    puts "Total Bill = #{total_bill = bill1 + bill2}"
    puts "Tax : #{self.tax}"
    puts "Grand Total : #{(total_bill * (1 + self.tax.to_i / 100.0)).round(2)}"
    puts "-" * 50
  end

  def generate_output_for_non_event_stay(total_days_of_stay)
    puts "Hotel Rent : #{self.rate}"
    puts "Total Days of Stay : #{total_days_of_stay}"
    puts "Total Bill Of Stay : #{bill1 = total_days_of_stay * self.rate.to_i}"
    puts "Tax : #{self.tax}"
    puts "Grand Total : #{(bill1 * (1 + self.tax.to_i / 100.0)).round(2)}"
    puts "-" * 50
  end

  def calculate_rent(user_start_date, user_end_date)
    event_not_found = ""
    if(@events.length != 0)
      @events.each do |event|
        event_start_date = event.start_date
        event_end_date = event.end_date
        if(occurence_of_event?(user_start_date, user_end_date, event_start_date, event_end_date))
          generate_output_during_event_stay(user_start_date, user_end_date, event_start_date, event_end_date, event)
          return false
        else
          event_not_found = true
        end
      end
      if(event_not_found)
        total_days_of_stay = Integer(user_end_date - user_start_date) + 1
        generate_output_for_non_event_stay(total_days_of_stay)
      end
    else
      total_days_of_stay = Integer(user_end_date - user_start_date) + 1
      generate_output_for_non_event_stay(total_days_of_stay)
    end
  end
end

class HotelRentCalculator
  @@hotel_data
  def initialize
    @@hotel_data = load_hotel_data
    @hotel_array = []
    generate_hotel_objects
  end

  def load_hotel_data()
    JSON.parse(IO.read("hotels.json"))  
  end

  def generate_hotel_objects
    @@hotel_data.each do |h|
      hotel = Hotel.new(h)
      @hotel_array.push(hotel)
    end
  end

  def get_rates
    @hotel_array.each do |hotel|
      puts "Hotel Name : #{hotel.name}"
      hotel.calculate_rent(@start_date, @end_date)
    end
  end

  def get_dates
    puts "Enter the start date (DD/MM/YYYY)"
    @start_date = gets.chomp
    @start_date = Date.parse(@start_date)
    puts "Enter The end Date (DD/MM/YYYY)"
    @end_date = gets.chomp
    @end_date = Date.parse(@end_date)
    if(@start_date > @end_date)
      puts "Invalid Dates Entered"
      exit(0)
    end
  end
end

h = HotelRentCalculator.new
h.get_dates
h.get_rates