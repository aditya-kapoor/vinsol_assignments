class Array
  def powers(powers)
    output_array = []
    self.inject(powers) { |a,b| output_array.push(b**powers) }
    output_array
  end
end

puts [1,2,3,4,5,6,7].powers(3)
