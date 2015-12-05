#################
# 	Pieslicer   #
# 	  2015      #
#################

## --- Day 5, part 1: Doesn't He Have Intern-Elves For This? ---

# Santa needs help figuring out which strings in his text
# file are naughty or nice.
#
# A nice string is one with all of the following properties:
#
#  -  It contains at least three vowels (aeiou only), like
#     aei, xazegov, or aeiouaeiouaeiou.
#
#  -  It contains at least one letter that appears twice in
#     a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc,
#     or dd).
#
#  -  It does not contain the strings ab, cd, pq, or xy,
#     even if they are part of one of the other requirements.

# How many strings are nice?

# ******** FUNCTIONS ******** #

def isNice(string)

	# string contains letter occuring twice
	if !string.match /([a-z])\1/
		return false
	end

	# string contains ab, cd, pq or xy
	if string.match /ab|cd|pq|xy/
		return false
	end

	# get all occurences of vowels
	numberOfVowels = string.scan /(a|e|i|o|u)/
	if numberOfVowels.size < 3
		return false
	end

	return true
end

# ********** BODY *********** #

file = File.new("input.txt", "r")
numberOfNiceWords = 0

while word = file.gets
	if isNice(word)
		numberOfNiceWords = numberOfNiceWords + 1
	end
end

puts "Number of nice strings in file = " + numberOfNiceWords.to_s
