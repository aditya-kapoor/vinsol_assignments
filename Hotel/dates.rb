require 'date'

start_date = "28-12"
end_date = "1-1"
year = Date.today.year

if(Date.parse(start_date+"-"+year.to_s).month == 12)
	if(Date.parse(end_date+"-"+year.to_s).month != 12)
		end_date = end_date + "-" + (year+1).to_s
	end
end

puts Date.parse(start_date)
puts Date.parse(end_date)