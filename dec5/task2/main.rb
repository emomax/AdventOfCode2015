#################
# 	Pieslicer   #
# 	  2015      #
#################

## --- Day 5, part 2: Doesn't He Have Intern-Elves For This? ---

# Realizing the error of his ways, Santa has switched to
# a better model of determining whether a string is naughty
# or nice. None of the old rules apply, as they are all
# clearly ridiculous.
#
# Now, a nice string is one with all of the following properties:
#    - It contains a pair of any two letters that appears
#      at least twice in the string without overlapping,
#      like xyxy (xy) or aabcdefgaa (aa), but not like aaa
#      (aa, but it overlaps).
#    - It contains at least one letter which repeats with
#      exactly one letter between them, like xyx, abcdefeghi
#      (efe), or even aaa.


# ******** FUNCTIONS ******** #

def isNice(string)

	# string contains a letter followed by any other letter
	# followed by the first letter (i.e. aba or kck)
	if !string.match /([a-z])[a-z]\1/
		return false
	end

	# string contains a pair of any two letters that
	# appear at least twice in the string without
	# overlapping
	if !string.match /([a-z]{2})[a-z]*\1/
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
