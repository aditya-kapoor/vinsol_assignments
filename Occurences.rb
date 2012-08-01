puts "Enter an Input String"
answer = gets

answer = answer.chomp

hash = Hash.new(0)
	answer.each_char do |n|
	  hash[n] += 1
	end 
puts hash
