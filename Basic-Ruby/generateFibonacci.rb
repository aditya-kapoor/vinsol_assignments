def generate_fibonacci(num=1000)
  initial_number1, initial_number2 = 0, 1
  while (initial_number1 < num) do
    yield(initial_number1)
    initial_number1, initial_number2 = initial_number2, initial_number1 + initial_number2 
  end
  puts "\n"
end

generate_fibonacci() {|series_number| print "#{series_number} " }
