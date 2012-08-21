def replaceVowels(str)
	pattern = /[aeiou]/i
	str.gsub!(pattern,'*')
end

puts "Enter A String"
str = gets.chomp
puts replaceVowels(str)
