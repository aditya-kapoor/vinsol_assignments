def factorial(n)
  prod = 1
  for i in (1..n)
    prod *= i
  end
  prod 
end

def pascal(num)
  0.upto(num) do |i|
    yield(i)
    puts "\n"
  end
end

puts "Enter a Number to find pascal traingle upto :"
number = gets.chomp

pascal(Integer(number)) {|i| 0.upto(i) do |j|
  print (factorial(i) / (factorial(j) * factorial(i-j)))
  print " "
  end
}
