$class_name = ""
$global_array = []
$method_names = []
def get_method_names(filename)
  File.open(filename).first
end

def create_class (filename)
  $class_name = filename.split(".")[0].capitalize
  $method_names = get_method_names(filename).split(",").each {|word| word.strip! }
  Object::const_set($class_name.to_sym, Class.new do
    (0...$method_names.size).to_a.each do |i|
      attr_accessor $method_names[i].to_sym
    end
  end
  )
  create_object_array(filename)
end

def create_object_array(filename)
  method_line = get_method_names(filename)
  File.open(filename) do |file|
    file.each_line do |line|
      if(line == method_line)
        next
      else
        object = Object.const_get($class_name).new
        values = line.split(",").each { |word| word.strip! }
        (0...$method_names.size).to_a.each do |i|
          object.send("#{$method_names[i]}=","#{values[i]}")
        end
        $global_array << object
      end
    end
  end
end

def display_object_values
  $global_array.each do |object|
    puts "#{$class_name} Object # : #{$global_array.index(object)+1}"
    (0...$method_names.size).to_a.each do |i|
      print "#{$method_names[i]} : "
      puts object.send("#{$method_names[i]}").capitalize
    end
  end
end

puts "Enter the name of the CSV File (movies.csv | persons.csv)"
filename = gets.chomp
create_class(filename)
display_object_values
