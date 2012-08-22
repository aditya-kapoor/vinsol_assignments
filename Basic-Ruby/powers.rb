class Array
  def powers(powers)
    @output = Array.new()
    self.each do |n|
    @output.push(n ** powers)
   end
   print @output
   puts "\n"
  end
end

[1,2,3,4,5,6,7].powers(3)
