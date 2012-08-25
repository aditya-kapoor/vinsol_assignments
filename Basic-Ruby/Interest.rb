class Interest
@@rate = 10.0/100
  def initialize(principal, time)
    @principal = principal
    @time = time
  end
  def generate_SI()
    @amount_SI = @principal * @time * @@rate + @principal
  end
  def generate_CI()
    @amount_CI = @principal * (1+@@rate)**@time
  end
  def get_difference()
    @amount_CI - @amount_SI
  end
end

puts "Enter principal"
principal = gets.chomp
puts "Enter Time"
time = gets.chomp
i1 = Interest.new(principal.to_i, time.to_i)
puts i1.generate_SI()
puts i1.generate_CI()
puts i1.get_difference()
