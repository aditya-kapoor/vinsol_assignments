def countChars(str)
	upper_count = lower_count = digit_count = special_count = 0
	str.each_char do |c|
		case c
			when 'a'..'z' then lower_count+=1
			when 'A'..'Z' then upper_count+=1
			when '0'..'9' then digit_count+=1
			else special_count+=1
		end
	end
	puts "Upper Char Count : #{upper_count}"
	puts "Lower Char Count : #{lower_count}"
	puts "Digit Count: #{digit_count}"
	puts "Special Char Count : #{special_count}"
end

puts "Enter a String :"
str = gets.chomp!
countChars(str)
