def replace_vowels(str)
  pattern = /[aeiou]/i
  str.gsub!(pattern,'*')
end

puts "Enter A String"
str = gets.chomp
puts replace_vowels(str)
