def get_palindrome

	choice = 'y'
	while choice == 'y'
		puts "Enter an Input String"
		str = gets
		str = str.chomp
		str.downcase!
		if(str == str.reverse)
			puts "The String is a palindrome"
		else
			puts "The String is not a palindrome"
		end
		puts "Do You want to test more strings (y|n)"
		choice = gets
		choice = choice.chomp
	end

end

get_palindrome()