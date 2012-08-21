def Sumtime(arr)
	total_seconds, total_minutes, total_hours = 0,0,0
	for i in 0...arr.length do
		hour,min,sec = arr[i].split(":")
		total_seconds += sec.to_i
		total_minutes += min.to_i
		total_hours += hour.to_i
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

def generateTimeString(t1)
	time_str = t1.strftime("%H:%M:%S")
	time_str
end


t1 = generateTimeString(Time.new)
t2 = generateTimeString(Time.new)
t3 = generateTimeString(Time.new)
t4 = generateTimeString(Time.new)

arr = [t1,t2,t3,t4]

Sumtime(arr)
