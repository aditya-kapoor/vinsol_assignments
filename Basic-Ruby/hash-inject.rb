require_relative 'Array-Hash'

def generate_hash(array)
  hash = calculate_hash(array)
  intermediate_hash = {}
  intermediate_hash['even'] = []
  intermediate_hash['odd'] = []
  final_hash = hash.inject(intermediate_hash) do |intermediate_hash, element|
    if element[0].even?
      intermediate_hash['even'] << element[1]
    else
      intermediate_hash['odd'] << element[1]
    end
    intermediate_hash
  end
end

array = ['abc','def',1234,234,'abcd','x','mnop',5,'ZzZZ']
puts generate_hash(array)
