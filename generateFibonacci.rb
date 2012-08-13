def generateFibonacci(num=1000)
	initial_number1 = 0
	initial_number2 = 1
	series_number = 0
	while (series_number < num) do
		series_number = initial_number1 + initial_number2
		initial_number1 = initial_number2
		initial_number2 = series_number
		puts "#{series_number}"
	end
end

generateFibonacci()
