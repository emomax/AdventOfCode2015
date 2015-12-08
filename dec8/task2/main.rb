#################
#   Pieslicer   #
#      2015     #
#################

## --- Day 8, task 2: Matchsticks ---

# Now, let's go the other way. In addition to
# finding the number of characters of code,
# you should now encode each code representation
# as a new string and find the number of characters
# of the new encoded representation, including
# the surrounding double quotes.

# Your task is to find the total number of
# characters to represent the newly encoded
# strings minus the number of characters of
# code in each original string literal. For
# example, for the strings above, the total
# encoded length (6 + 9 + 16 + 11 = 42) minus
# the characters in the original code
# representation (23, just like in the first
# part of this puzzle) is 42 - 23 = 19.


# ****** FUNCTIONS ****** #

def parseRow(row)
	literalLength = row.length
	newStringLiteralsLength = 0

	appended = row

	# replace quotes '"' with '\"'
	# but map '\' to '.' to avoid problems
	# further down
	if appended.match /\"/
		appended.gsub! /\"/, '."'
	end
	if appended.match /\\/
		appended.gsub! /\\/, "\\\\\\"
	end

	appended = '"' + appended + '"'

	return literalLength, appended.length
end

# ******** BODY ********* #

stringLiterals = 0
newStringLiterals = 0

newSize = 0

file = File.new("input.txt", "rb")
while row = file.gets# and $line < 30
	row.strip!

	literal, newLiteral = parseRow(row)

	stringLiterals = stringLiterals + literal
	newStringLiterals = newStringLiterals + newLiteral
end
file.close

size = newStringLiterals - stringLiterals

puts "Size of Santa's (new) list: " + size.to_s
