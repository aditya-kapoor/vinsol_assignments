def readFile()
  designations = Hash.new(0)
  File.open("test_file.csv","r") do |file|
    file.each_line { |line| 
      entries_per_line = line.split(",").each { |word| word.strip!}
      name = entries_per_line[0]
      empId = entries_per_line[1]
      particular_designation = entries_per_line[2]
      if(designations.has_key?(particular_designation))
        designations[particular_designation] << "#{name} (EmpId : #{empId}) "
      else
        designations[particular_designation] = Array.new()
        designations[particular_designation] << "#{name} (EmpId : #{empId}) "
      end
    }
  end
  writeFile(designations)
end

def writeFile(designations)
  File.open("output.csv","w") do |file|
    designations.each_key {|key|
    file.puts key
    designations.each_pair { |key1,value|
      if(key1 == key)
        file.puts(value)
      end
      }
    }
  end
end

readFile()
