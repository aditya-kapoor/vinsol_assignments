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
interest = Interest.new(principal.to_i, time.to_i)
puts interest.generate_SI()
puts interest.generate_CI()
puts interest.get_difference()
