def calculate_hash(arr)
	hash = Hash.new(0) 
	for i in 0...arr.length
		len = arr[i].to_s.length

		if(hash.has_key?(len)) 
			hash[len] << arr[i]
		else
			hash[len] = Array.new()
			hash[len] << arr[i]
		end
	end
	hash.each {|key, value|   
		puts "Hash having key #{key} has the values as " 
		value.each { |x| print x,' ' 
		puts "\n"}
	}
end
#puts hash 
#/* This line would work in the Ruby 1.9.1 but the above code runs correctly in the Ruby 1.8.7 */
arr = ['abc','def',1234,234,'abcd','x','mnop',5,'zZzZ']
calculate_hash(arr)