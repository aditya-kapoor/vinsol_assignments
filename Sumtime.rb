def Sumtime(t1,t2,t3,t4)
	total_seconds = t1.sec + t2.sec + t3.sec + t4.sec
	total_minutes = t1.min + t2.min + t3.min + t4.min
	total_hours = t1.hour + t2.hour + t3.hour + t4.hour
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
t3 = Time.new()
t4 = Time.new()

Sumtime(t1,t2,t3,t4)