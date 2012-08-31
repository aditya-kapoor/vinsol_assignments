# def generate_hash(array)
#   hash = Hash.new(0)
#   hash ['even'],hash['odd'] = array.partition {|element| element.to_s.size.even?}
#   hash
# end
require_relative 'Array-Hash.rb'

def generate_hash(array)
  hash = calculate_hash(array)
  intermediate_hash = Hash.new(0)
  intermediate_hash['even'] = Array.new()
  intermediate_hash['odd'] = Array.new()
  final_hash = hash.inject(intermediate_hash) do |intermediate_hash,element|
    
  end
end

array = ['abc','def',1234,234,'abcd','x','mnop',5,'ZzZZ']
puts generate_hash(array)