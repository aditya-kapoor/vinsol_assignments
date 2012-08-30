class Array
  @powers 
  def powers(powers)
    output_array = []
    self.inject(powers) { |a,b| output_array.push(b**powers) }
    output_array
  end
  def powers2(powers)
    @powers = powers
    self.collect { |i| i**@powers }
  end
end

puts [1,2,3,4,5,6,7].powers(3)
puts [1,2,3,4,5,6,7].powers2(3)
