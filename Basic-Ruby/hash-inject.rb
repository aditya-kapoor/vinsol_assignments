def generate_hash(array)
  hash = Hash.new(0)
  hash ['even'],hash['odd'] = array.partition {|element| element.to_s.size.even?}
  hash
end

array = ['abc','def',1234,234,'abcd','x','mnop',5,'ZzZZ']
puts generate_hash(array)
