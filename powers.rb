class Array
  def powers(powers)
    @output = Array.new()
    self.each do |n|
    @output.push(n ** powers)
   end
  end
  def showpowers()
    puts @output
  end
end

n = [1,2,3,4,5,6,7]
n.powers(3)
n.showpowers()
