# def generate_hash(array)
#   hash = Hash.new(0)
#   hash ['even'],hash['odd'] = array.partition {|element| element.to_s.size.even?}
#   hash
# end

def calculate_hash(arr)
  hash = Hash.new(0) 
  for i in 0...arr.length
    len = arr[i].to_s.length

    if(hash.has_key?(len)) 
      hash[len] << arr[i]
    else
      hash[len] = Array.new()
      hash[len] << arr[i]
    end
  end
  hash
end

def generateHash(array)
  hash = calculate_hash(array)
  intermediate_hash = Hash.new(0)
  intermediate_hash['even'] = Array.new()
  intermediate_hash['odd'] = Array.new()
  final_hash = hash.inject(intermediate_hash) do |intermediate_hash,element|
    if element[0].even?
      intermediate_hash['even'] << element[1]
    else
      intermediate_hash['odd'] << element[1]
    end
    intermediate_hash
  end
end

array = ['abc','def',1234,234,'abcd','x','mnop',5,'ZzZZ']
puts generateHash(array)