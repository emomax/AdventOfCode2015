#################
#   Pieslicer   #
#      2015     #
#################

## --- Day 8, task 1: Matchsticks ---

# Space on the sleigh is limited this year, and
# so Santa will be bringing his list as a digital
# copy. He needs to know how much space it will
# take up when stored.

# It is common in many programming languages to
# provide a way to escape special characters in
# strings. For example, C, JavaScript, Perl, Python,
# and even PHP handle special characters in very similar ways.

# However, it is important to realize the difference
# between the number of characters in the code
# representation of the string literal and the number
# of characters in the in-memory string itself.

# Santa's list is a file that contains many double-quoted
# string literals, one on each line. The only escape
# sequences used are \\ (which represents a single backslash),
# \" (which represents a lone double-quote character),
# and \x plus two hexadecimal characters (which represents
# a single character with that ASCII code).

# Disregarding the whitespace in the file, what is the
# number of characters of code for string literals
# minus the number of characters in memory for the
# values of the strings in total for the entire file?

# ****** FUNCTIONS ****** #

def parseRow(row)
	literalLength = row.length
	inMemoryLength = 0

	stripped = row
	stripped[row.length - 1] = ""
	stripped[0] = ""
	if stripped.match /\\x[a-f0-9]{2}/
		stripped.gsub! /\\x[a-f0-9]{2}/, "\."
	end
	if stripped.match /\\\\/
		stripped.gsub! /\\\\/, "\\"
	end
	if stripped.match /\\"/
		stripped.gsub! /\\"/, "\""
	end

	return literalLength, stripped.length
end

# ******** BODY ********* #

stringLiterals = 0
inMemory = 0

file = File.new("input.txt", "rb")
while row = file.gets# and $line < 30
	row.strip!

	literal, inMem = parseRow(row)

	stringLiterals = stringLiterals + literal
	inMemory = inMemory + inMem
end
file.close

size = stringLiterals - inMemory

puts "Size of Santa's list: " + size.to_s
