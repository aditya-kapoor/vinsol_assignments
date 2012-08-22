def factorial(n)
  prod = 1
  for i in (1..n)
    prod *= i
  end
  "Fatorial Is: #{prod}" 
end

puts "Enter a Number : "
number = gets.chomp
puts factorial(number.to_i)

