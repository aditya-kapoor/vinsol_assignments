def sum_time(arr)
  total_seconds, total_minutes, total_hours = 0,0,0
  for i in 0...arr.length do
    hour,min,sec = arr[i].split(":")
    total_seconds += sec.to_i
    total_minutes += min.to_i
    total_hours += hour.to_i
  end
  extra_minutes, total_seconds = total_seconds.divmod(60)
  total_minutes += extra_minutes
  extra_hours, total_minutes = total_minutes.divmod(60)
  total_hours += extra_hours 
  puts "The total time is #{total_hours / 24} days and #{total_hours % 24}:#{total_minutes}:#{total_seconds}"
end

def generate_time_string(t1)
  time_str = t1.strftime("%H:%M:%S")
end


t1 = generate_time_string(Time.new)
t2 = generate_time_string(Time.new)
t3 = generate_time_string(Time.new)
t4 = generate_time_string(Time.new)

arr = [t1,t2,t3,t4]

sum_time(arr)
