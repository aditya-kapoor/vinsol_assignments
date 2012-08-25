def generate_reverse_string(str)
  str.reverse.split(" ").each { |word| word.reverse! }.join(" ")
end

str = "An apple a day keeps the doctor away"
puts generate_reverse_string(str)
