def match_pattern(str, pattern)
  occurence_count = 0
  pattern = Regexp.new(pattern,true)
  new_str = str.gsub(pattern) do |match|  
    occurence_count+=1
    "(#{match})" 
  end 
  puts new_str
  puts "Total Occurences found: #{occurence_count}"
end

puts "Enter An Input String : "
input_string = gets.chomp
puts "Enter A Pattern : "
pattern = gets.chomp
match_pattern(input_string, pattern)
