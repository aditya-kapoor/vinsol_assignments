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
			puts "Invalid Combination of dates"
			exit(0)
		end
	end
	def load_hotel_data
		@@hotel_data= JSON.parse(IO.read("hotels.json"))	
	end
	def generateEventDates(params)
		current_year = Date.today.year
		start_date = ""
		end_date = ""
		start_date = params["start"] + "-" + current_year.to_s
		end_date = params["end"] + "-" + current_year.to_s
		if(Date.parse(start_date) >= Date.today)
			#Do Nothing
		else
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
	def occurence_of_event?(start_date,end_date)
		event_range = (start_date..end_date).to_a
		user_range = (@start_date..@end_date).to_a
		status = user_range.any? do |date|
			event_range.include?(date)
		end
		status
	end
	def generateRates()
		current_year = @start_date.year
		@@hotel_data.each do |hotel|
			total_bill = 0
			normal_days, event_days = 0,0
			puts "Hotel Name   : #{hotel["Hotel_name"]} "
			puts "Normal Rent Per Day : #{hotel["rate"]}"
			if(hotel.has_key?('seasonal_rates'))
				hotel["seasonal_rates"].each do |special_occasion|
					special_occasion.each do |occasion,params|
						event_start_date,event_end_date = generateEventDates(params)
						if(occurence_of_event?(event_start_date,event_end_date))
							normal_days,event_days = calculateDays(event_start_date,event_end_date)
							puts "Sub-Total Bill for #{event_days} Days: #{total_bill += event_days.to_i * params["rate"].to_i}"
						else
							normal_days, event_days = calculateDays(event_start_date,event_end_date)
						end
						# normal_days, event_days = calculateDays(event_start_date,event_end_date)
						# puts "Sub-Total Bill for #{normal_days} Days: #{bill1 = normal_days.to_i * hotel["rate"].to_i}"
						# puts "Sub-Total Bill for #{event_days} Days during the #{occasion}: #{bill2 = event_days.to_i * params["rate"].to_i}"
						# total_bill = bill1 + bill2
					end
				end
				puts "Sub-Total Bill for #{normal_days} Days: #{total_bill += normal_days.to_i * hotel["rate"].to_i}"
				puts "Total Bill of Your Stay : #{total_bill}"
			else
				normal_days, event_days = totalDays()
				puts "Total Bill For Your Stay: #{hotel['rate'].to_i * normal_days.to_i}"
			end
		end
	end
	def calculateDays(event_start_date,event_end_date)
		normal_days = event_days = 0
		if(@start_date < event_start_date)
			if(@end_date < event_start_date)
				#puts "The user is staying in the hotel not during the time of event(p1)"
				normal_days,event_days = totalDays()
			else
				if(@end_date < event_end_date)
					#puts "The user checked in before the start of event and will leave during the time of event(P2)"
					normal_days,event_days = totalDays(@start_date,event_start_date,@end_date)
				else
					#puts "The user checked in before the start of event and would leave after the end of event(P5)"
					normal_days,event_days = totalDays(@start_date,event_start_date,event_end_date,@end_date)
				end
			end
		else
			if(@end_date < event_start_date)
				#puts "Impossible condition"
			else
				if(@end_date < event_end_date)
					#puts "The user checked into the hotel after the start of event and would leave before the end of event(P3)"
				else
					#puts "The user checked into the hotel after the start of event and would leave after the end of event(P4)"
				end
			end
		end
	end
	def totalDays(*dates)
		normal_days = event_days = 0
		case dates.length
		when 0 then
			normal_days = Integer(@end_date - @start_date)
		when 3 then
			normal_days = Integer(dates[1] - dates[0])
			event_days = Integer(dates[2] - dates[1])
		when 4 then
			normal_days += Integer(dates[1] - dates[0])
			normal_days += Integer(dates[3] - dates[2])
			event_days = Integer(dates[2] - dates[1])
		end
		return normal_days,event_days
	end
end


h = Hotel.new()
h.load_hotel_data()
h.generateRates()
# start_date = Date.parse("28-12-2012")
# end_date = Date.parse("5-1-2013")
# h.occurence_of_event?(start_date,end_date)