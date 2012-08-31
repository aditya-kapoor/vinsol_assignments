require 'json'
require 'date'

  def Date.get_formatted_date(date)
    current_year = Date.today.year
    temp_date = date + "-" + current_year.to_s
    if(Date.parse(temp_date) <= Date.today)
      temp_date = date+"-"+(current_year+1).to_s
    end
    Date.parse(temp_date)
  end 

class Event
  def initialize(name, contents)
    @name = name
    @start_date = contents["start"]
    @end_date = contents["end"]
    @event_rate = contents["rate"].to_i
    puts Date.get_formatted_date(@start_date)
  end
end

class Hotel
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

  def get_hotels
    puts @hotel_array
  end
end

h = HotelRentCalculator.new
# h.get_hotels