require 'json'
require 'date'

class Hotel
  @@hotel_data
  def initialize
    puts "Enter the start date"
    @start_date = gets.chomp
    @start_date = Date.parse(@start_date)
    puts "Enter The end Date"
    @end_date = gets.chomp
    @end_date = Date.parse(@end_date)
    if(@start_date > @end_date)
      puts "Invalid Dates Entered"
      exit(0)
    end
  end
  def generate_event_dates(params)
    current_year = Date.today.year
    start_date, end_date = "", ""
    start_date = params["start"] + "-" + current_year.to_s
    end_date = params["end"] + "-" + current_year.to_s
    if(Date.parse(start_date) <= Date.today)
      start_date = params["start"]+"-"+(current_year+1).to_s
      end_date = params["end"]+"-"+(current_year+1).to_s
    end
    if(Date.parse(start_date).month == 12) #Adjusting for the new year
      if(Date.parse(end_date).month != 12)
        end_date = params["end"]+"-"+(current_year+1).to_s
      end
    end
    return Date.parse(start_date), Date.parse(end_date)
   end
  
  def load_hotel_data()
    @@hotel_data= JSON.parse(IO.read("hotels.json"))	
  end
  
  def get_normal_days_on_non_event_days()
    Integer(@end_date - @start_date)+1
  end
  def generate_rates()
    current_year = Date.today.year
    @@hotel_data.each do |hotel|
      total_bill = 0
      puts "Hotel Name   : #{hotel["Hotel_name"]} "
      if(hotel.has_key?('seasonal_rates'))
        hotel["seasonal_rates"].each do |special_occasion|
          special_occasion.each do |occasion, params|
            normal_days, event_days = 0,0
            event_start_date, event_end_date = generate_event_dates(params)
            if(occurence_of_event?(event_start_date, event_end_date))
              normal_days, event_days = get_days(event_start_date, event_end_date)
            else
              normal_days = get_normal_days_on_non_event_days()
            end
            puts "Normal Rent Per Day : #{hotel["rate"]}"
            puts "Total Number of Normal Days of Stay: #{normal_days}"
            puts "Total Rent For Normal Days : #{bill1 = normal_days.to_i * hotel["rate"].to_i}"
            puts "Special Rent Per Day for #{occasion}: #{params["rate"]}"
            puts "Total Number of Days of Stay during #{occasion}: #{event_days}"
            puts "Total Rent For Days during #{occasion} : #{bill2 = event_days.to_i * params["rate"].to_i}"
            total_bill = bill1 + bill2
            break
          end
          puts "Taxes on your stay: #{hotel["tax"]}%"
          puts "Total Bill For Your Stay : #{total_bill}"
          puts "Grand Total : #{total_bill + (total_bill*hotel["tax"].to_i/100.0)}"
          print "-"*30
          puts ""
          break
         end
      else
        normal_days = get_normal_days_on_non_event_days()
        puts "Rent for a Single Day : #{hotel["rate"]}"
        puts "Total Numbers of Days of Stay: #{normal_days}"
        puts "Taxes on your stay : #{hotel["tax"]}%"
        puts "Total Bill for Your Stay: #{total_bill = normal_days.to_i * hotel["rate"].to_i }"
        puts "Grand Total : #{total_bill + (total_bill*hotel["tax"].to_i/100.0)}"
        print "-"*30
        puts ""
      end
    end
  end

  def occurence_of_event?(start_date, end_date)
    event_range = (start_date..end_date).to_a
    user_range = (@start_date..@end_date).to_a
    status = user_range.any? do |date|
      event_range.include?(date)
    end
    status
  end

  def get_days(event_start_date, event_end_date)
    event_range = (event_start_date..event_end_date).to_a
    user_stay_range = (@start_date..@end_date).to_a
    event_stay_dates = event_range & user_stay_range
    event_days = event_stay_dates.size
    normal_days = user_stay_range.size - event_days
    return normal_days, event_days
  end
  private :get_days, :occurence_of_event?,:generate_event_dates
end


h = Hotel.new()
h.load_hotel_data()
h.generate_rates()
