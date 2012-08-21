def factorial(n)
	begin 
		if n < 0
			raise
		else
			prod = 1
			for i in (1..n)
			prod *= i
		end
	prod
	end
	rescue
		print "Please Enter a Positive Number"
	end
end

puts "Enter a Number : "
number = gets.chomp
puts factorial(number.to_i)
