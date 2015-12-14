#################
#   Pieslicer   #
#      2015     #
#################

## --- Day 10: Elves Look, Elves Say ---

# Today, the Elves are playing a game called 
# look-and-say. They take turns making sequences 
# by reading aloud the previous sequence and 
# using that reading as the next sequence. For 
# example, 211 is read as "one two, two ones", 
# which becomes 1221 (1 2, 2 1s).

# Look-and-say sequences are generated iteratively, 
# using the previous value as input for the next 
# step. For each step, take the previous value, 
# and replace each run of digits (like 111) with 
# the number of digits (3) followed by the digit 
# itself (1).

# ****** FUNCTIONS ****** #

def lookAndSayIterative(word)
	currChar = ""
	charTimes = 1
	newWord = ""
	
	while word && word.length != 0
		charTimes = 1
		currChar = word[0]
		word[0] = ""

		while word[0] == currChar
			charTimes += 1
			word[0] = ""
		end

		newWord << charTimes.to_s + currChar
	end
	return newWord
end

def lookAndSayRegex(word)
	newString = ""

	while word.length != 0
		times, token = word.match(/^((\d)(?:\2)*)/).captures
		newString << times.to_s.length.to_s + token.to_s
		word.gsub! /^((\d)(?:\2)*)/, ""
	end
	return newString
end

# *** GLOBAL VARIABLES ** #

# ******** BODY ********* #

startString = "1113122113"
maxIterations = 40

(1..maxIterations).each do
	startString = lookAndSayIterative(startString)
end

puts "Length of look-and-say transformed string: " + startString.length.to_s
