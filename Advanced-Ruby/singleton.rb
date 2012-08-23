class String
  class << self
    def speak
      puts "Hello World"
    end
  end
end

String.speak

begin
  "Thing".speak  
rescue Exception => e
  puts "Thing Cannot Speak"
end

animal = "cat"

def animal.speak
  puts "Meow"
end

animal.speak

begin
  "dog".speak
rescue Exception => e
  puts "Instance Dog doesnt speak"
end