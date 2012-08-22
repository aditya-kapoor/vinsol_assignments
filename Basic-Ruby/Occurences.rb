def getHash()
puts "Enter an Input String"
answer = gets.chomp
hash = Hash.new(0)
pattern = /[A-Z]/i
answer.each_char do |n|
if(n.match(pattern))
    hash[n] += 1
  end
end  
hash
end
hash = getHash()
puts hash
