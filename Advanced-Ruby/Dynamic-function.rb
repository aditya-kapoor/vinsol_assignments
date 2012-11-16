class Function
  def self.create_dynamic_function(name,lines_of_code)
    define_method(name) do |*args|
      instance_eval(lines_of_code)
    end
  end
end

object = Function.new
puts "Enter the name of the function"
name = gets.chomp
puts "Enter the line of code"
lines_of_code = gets.chomp
Function.create_dynamic_function(name,lines_of_code)
puts "Calling the Dynamically created function"
puts object.send(name)
