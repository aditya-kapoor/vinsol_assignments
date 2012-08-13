class Interest
@@rate = 10.0/100
	def initialize(principal,time)
		@principal = principal
		@time = time
	end
	def generateSI()
		@amount_SI = @principal * @time * @@rate + @principal
	end
	def generateCI()
		@amount_CI = @principal * (1+@@rate)**@time
	end
	def getDifference()
		@amount_CI - @amount_SI
	end
end
puts "Enter principal"
principal = gets.chomp
puts "Enter Time"
time = gets.chomp
i1 = Interest.new(principal.to_i,time.to_i)
puts i1.generateSI()
puts i1.generateCI()
puts i1.getDifference()