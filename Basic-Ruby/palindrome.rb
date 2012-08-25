def get_palindrome()
  str = ""
  until str.match(/q/i) 
    puts "Enter an Input String"
    str = gets.chomp
    str.downcase!
    exit(0) if(str.match(/q/i))
    check_palindrome(str)
  end

  #Second Way of doing it
  # loop do
  #   puts "Enter an Input String"
  #   str = gets.chomp
  #   str.downcase!
  #   exit(0) if(str.match(/q/i))
  #   check_palindrome(str)
  # end
 
  
end

def check_palindrome(str)
  if(str == str.reverse)
    puts "The String is a palindrome"
  else
    puts "The String is not a palindrome"
  end
end

get_palindrome()
