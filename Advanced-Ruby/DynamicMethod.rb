class DynamicMethod < String

  instance_eval do
    def getMethods
      (DynamicMethod.new("").methods - String.new.methods)
    end 

    def initiateProgram
      puts "Welcome to this program...You have to make an instance of this class"
      puts "The format would be DynamicMethod.new('<string>')"
      puts "Now Please enter an object"
      object = gets
      puts "Now That you have created object...please select any of the methods below"
      puts "In the format object.<method-name>"
      puts getMethods
      object += gets
      puts eval(object)
    end
  end

  def initialize(str)
    super(str)
  end

  def exclude?(str)
    !(self.include?(str))
  end

  def palindrome?
    down_str = self.downcase
    (down_str == down_str.reverse)
  end

  def reverseString
    self.to_s.reverse.split(" ").each { |word| word.reverse! }.join(" ")
  end
end

# DynamicMethod.initiateProgram
