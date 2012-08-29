module MyObjectStore
  module ClassMethods
    $args_methods = []
    $global_objects = []
    def attr_accessor(*args)
      args.each do |arg|
        define_method(arg.to_sym) do 
          instance_variable_get("@#{arg}")
        end
        define_method("#{arg}=".to_sym) do |val| 
          instance_variable_set("@#{arg}",val) 
        end
      end
    end
    def validate_presence_of(*args)
      $args_methods = args
      def_args
    end
    def collect
      puts "The Globally Saved Objects are : "
      $global_objects.each do |obj|
        puts "Object Number #{$global_objects.index(obj)+1}"
        obj.instance_variables.each do |variable|
          puts "#{variable} : #{obj.instance_variable_get(variable)}"
        end
      end
    end
    def count
      puts "The Number of Saved Objects Are : #{$global_objects.length}"
    end
    def def_args
      metaclass = class << self; self ; end
      metaclass.instance_eval do 
        $args_methods.each do |arg| 
          define_method("find_by_#{arg}") do |val|
            $global_objects.each do |obj|
              if(obj.instance_variable_get("@#{arg}") == val)
                puts "The object having value #{arg} and having value as #{val} has been found"
                obj.instance_variables.each do |variable|
                  puts "#{variable} : #{obj.instance_variable_get(variable)}"
                end
              end
            end
          end
        end
      end
    end
  end
 
  def save
    if(self.class.method_defined?(:validate))
      if(self.validate)
        if(save_object)
          $global_objects<<self
        else
          puts "There was an error in saving the object"
        end
      else
        puts "The Object would not be saved"
      end
    else
      if(save_object)
        $global_objects<<self
      else
        puts "There was an error"
      end
    end
  end
  def save_object
    $args_methods.each do |arg|
      if(self.instance_variable_get("@#{arg}").nil?)
        puts "The object should have the value of #{arg}"
        return false
      else
        next
      end
    return true
    end
  end
  def self.included(klass)
    klass.extend ClassMethods  
  end
end

class Play
  include MyObjectStore
  attr_accessor :age, :fname, :lname
  validate_presence_of :age, :fname, :lname
  def validate
    if(self.class.to_s == self.class.to_s.capitalize)
      return true 
    else
      return false
    end
  end
end

p2 = Play.new
p2.fname = "abc"
p2.lname = "def"
p2.save

p1 = Play.new
p1.fname = "qwerty"
p1.lname = "def"
p1.age = 12
p1.save

p3 = Play.new
p3.fname = "qwerty"
p3.lname = "def"
p3.age = 45
p3.save

p4 = Play.new
p4.fname = "qwerty"
p4.lname = "def"
p4.age = 23
p4.save

Play.collect
Play.count
Play.find_by_fname("qwerty")
Play.find_by_age(45)