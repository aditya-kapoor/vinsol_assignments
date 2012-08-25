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
 puts hash
end

arr = ['abc','def',1234,234,'abcd','x','mnop',5,'zZzZ']
calculate_hash(arr)
