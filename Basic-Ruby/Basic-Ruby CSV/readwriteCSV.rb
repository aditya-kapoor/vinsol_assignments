def readFile()
  designations = Hash.new(0)
  File.open("test_file.csv", "r") do |file|
    file.each_line do |line| 
      entries_per_line = line.split(",").each { |word| word.strip!} #Removing leading and trailing spaces
      name = entries_per_line[0]
      empId = entries_per_line[1]
      particular_designation = entries_per_line[2]
      designations[particular_designation] = designations.fetch(particular_designation, [])
      designations[particular_designation].push("#{name} (EmpId : #{empId})")
    end
  end
  writeFile(designations)
end

def writeFile(designations)
  File.open("output.csv", "w") do |file|
    designations.each_key do |key|
      file.puts key
      designations.each_pair do |key_designations, value|
        if(key_designations == key)
          file.puts(value)
        end
      end
    end
  end
end

readFile()