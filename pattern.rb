def replaceVowels(str)
	pattern = /[aeiou]/i
	str.gsub!(pattern,'*')
end

puts replaceVowels("Auierop")
