puts "Enter an Input String"
answer = gets.chomp
hash = Hash.new(0)
pattern = /[A-Z]/i
answer.each_char do |n|
	if(n.match(pattern))
		hash[n] += 1
	end
end  
hash.each {|key,value| puts "#{key} has #{value} occurence(s)"}