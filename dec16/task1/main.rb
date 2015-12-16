#################
#   Pieslicer   #
#      2015     #
#################

## --- Day 16, task 1: Aunt Sue ---

# Your Aunt Sue has given you a wonderful
# gift, and you'd like to send her a thank
# you card. However, there's a small problem:
# she signed it "From, Aunt Sue".

# You have 500 Aunts named "Sue".

# So, to avoid sending the card to the wrong
# person, you need to figure out which Aunt Sue
# (which you conveniently number 1 to 500, for
# sanity) gave you the gift. You open the
# present and, as luck would have it, good ol'
# Aunt Sue got you a My First Crime Scene Analysis
# Machine! Just what you wanted. Or needed, as
# the case may be.

# It beeps inquisitively at you a few times and
# then prints out a message on ticker tape:

# children: 3
# cats: 7
# samoyeds: 2
# pomeranians: 3
# akitas: 0
# vizslas: 0
# goldfish: 5
# trees: 3
# cars: 2
# perfumes: 1

# You make a list of the things you can
# remember about each Aunt Sue. Things missing
# from your list aren't zero - you simply don't
# remember the value.

# What is the number of the Sue that got you the gift?

# ****** FUNCTIONS ****** #

def parseRow(row)
	auntNum, item1, value1, item2, value2, item3, value3 = row.match(/^Sue (\d{1,3})\: ([a-zA-Z]+):\ (\d{1,2}), ([a-zA-Z]+):\ (\d{1,2}), ([a-zA-Z]+):\ (\d{1,2})$/) .captures
	if rightAunt(item1, value1, item2, value2, item3, value3)
		return auntNum
	else
		return -1
	end
end

def rightAunt(item1, value1, item2, value2, item3, value3)
	if $input[item1] == value1.to_i && $input[item2] == value2.to_i && $input[item3] == value3.to_i
		return true
	end

	return false
end

# *** GLOBAL VARIABLES ** #

$input = Hash.new

$input["children"] = 3
$input["cats"] = 7
$input["samoyeds"] = 2
$input["pomeranians"] = 3
$input["akitas"] = 0
$input["vizslas"] = 0
$input["goldfish"] = 5
$input["trees"] = 3
$input["cars"] = 2
$input["perfumes"] = 1

# ******** BODY ********* #


file = File.new('input.txt', 'r')

while row = file.gets
	row.strip!
	auntNum = parseRow(row)

	if auntNum != -1
		puts 'The aunt Sue we are looking for is number: ' + auntNum
		break
	end
end
