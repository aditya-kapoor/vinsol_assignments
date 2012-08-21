def get_palindrome
	choice = 'y'
	while !choice.match(/q/i)
		puts "Enter an Input String"
		str = gets.chomp
		str.downcase!
		if(str == str.reverse)
			puts "The String is a palindrome"
		else
			puts "The String is not a palindrome"
		end
		puts "Do You want to quit (q|Q)"
		choice = gets
		choice = choice.chomp
	end

end

get_palindrome()
