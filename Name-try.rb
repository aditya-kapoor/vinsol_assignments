class Name
	def initialize
		puts "enter the firstname"
		@firstname = gets.chomp
		puts "enter the lastname"
		@lastname = gets.chomp
		begin
			if(@firstname.length == 0 || @lastname.length == 0)
				raise "Empty Name"
			else 
				if (@firstname != @firstname.capitalize)
				raise "First Name Should be Capitalized"
			end
			puts "Welcome #{@firstname}, #{@lastname}"
			end
		rescue Exception => e
			puts e.message	 
		end
	end
end
name = Name.new()
