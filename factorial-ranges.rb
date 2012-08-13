def factorial(n)
	prod = 1
	for i in (1..n)
		prod *= i
	end
	prod
end

puts factorial(5)