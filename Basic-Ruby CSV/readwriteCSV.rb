def readFile()
  designations = Hash.new(0)
  File.open("test_file.csv","r") do |file|
    file.each_line { |line| 
      entries_per_line = line.split(",").each { |word| word.strip!}
      if(designations.has_key?(entries_per_line[2]))
        designations[entries_per_line[2]] << "#{entries_per_line[0]} (EmpId : #{entries_per_line[1]}) "
      else
        designations[entries_per_line[2]] = Array.new()
        designations[entries_per_line[2]] << "#{entries_per_line[0]} (EmpId : #{entries_per_line[1]}) "
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
