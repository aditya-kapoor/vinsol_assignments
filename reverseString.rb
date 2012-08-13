def generateReverseString(str)
	str.reverse.split(" ").each { |word| word.reverse! }.join(" ")
end


str = "An apple a day keeps the doctor away"
puts generateReverseString(str)