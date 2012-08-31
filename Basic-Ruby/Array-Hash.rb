def calculate_hash(arr)
  hash = Hash.new(0) 
  arr.each do |element|
    len = element.to_s.length
    hash[len] = hash.fetch(len, [])
    hash[len].push(element)
  end
  hash
end

if(__FILE__ == $0)
  arr = ['abc','def',1234,234,'abcd','x','mnop',5,'zZzZ']
  puts calculate_hash(arr)
end
