def validateDate(time1,time2)
	datePattern = /([0-1]?[0-9]|2[0-3])\:([0-5]?[0-9])\:([0-5]?[0-9])/
	if( time1.match(datePattern) && time2.match(datePattern) )
		arr = [time1,time2]
		Sumtime(arr)
	else
		puts "Invalid Dates Entered"
	end
end

def Sumtime(arr)
	total_seconds, total_minutes, total_hours = 0,0,0
	for i in 0...arr.length do
		hours,minutes,seconds = arr[i].split(":")
		total_seconds += seconds.to_i
		total_minutes += minutes.to_i
		total_hours += hours.to_i
	end
	if(total_seconds > 60)
		total_minutes += total_seconds/60
		total_seconds = total_seconds % 60
	end
	if(total_minutes > 60)
		total_hours += total_minutes / 60
		total_minutes = total_minutes % 60
	end
	puts "The total time is #{total_hours/24} days and #{total_hours%24}:#{total_minutes}:#{total_seconds}"
end

t1 = Time.new()
t2 = Time.new()
date_string1 = t1.strftime("%H:%M:%S")
date_string2 = "25:78:98"
date_string3 = t2.strftime("%H:%M:%S")
validateDate(date_string1,date_string2)
validateDate(date_string1,date_string3)