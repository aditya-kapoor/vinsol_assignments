def generatePrimes(num)
	primes = Array.new()
	primes.push(2)
	primes.push(3)
	3.step(num,2) do |number|
		is_prime = false
		3.step((number-1)/2,2) do |divisor|
			if ((number%divisor) == 0)
				is_prime = false
				break
			else
				is_prime = true
			end
		end
	 	primes.push(number) if(is_prime)
	end
	"\nPrime Numbers which are generated are : \n#{primes}"
end


puts "Enter a Number Up to which we should calculate primes upto : (>2)"
number = gets.chomp
puts generatePrimes(Integer(number))
