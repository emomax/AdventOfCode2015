#################
#   Pieslicer   #
#      2015     #
#################

## --- Day 16, task 2 Aunt Sue ---

# As you're about to send the thank you 
# note, something in the MFCSAM's instructions 
# catches your eye. Apparently, it has an outdated 
# retroencabulator, and so the output from the 
# machine isn't exact values - some of them 
# indicate ranges.

# In particular, the cats and trees readings indicates 
# that there are greater than that many (due to the 
# unpredictable nuclear decay of cat dander and 
# tree pollen), while the pomeranians and goldfish 
# readings indicate that there are fewer than that 
# many (due to the modial interaction of magnetoreluctance).

# What is the number of the real Aunt Sue?

# ****** FUNCTIONS ****** #

def parseRow(row)
	auntNum, item1, value1, item2, value2, item3, value3 = row.match(/^Sue (\d{1,3})\: ([a-zA-Z]+):\ (\d{1,2}), ([a-zA-Z]+):\ (\d{1,2}), ([a-zA-Z]+):\ (\d{1,2})$/) .captures
	if rightAunt([item1, item2, item3], [value1, value2, value3])
		return auntNum
	else
		return -1
	end
end

def rightAunt(items, values)
	(0..(items.length-1)).each do |i|
		if !rightAttribute(items.at(i), values.at(i))
			return false
		end
	end
	return true
end


def rightAttribute(item, value)
	case item
	when 'cats', 'trees'
		return value.to_i > $input[item]
	when 'pomeranians', 'goldfish'
		return value.to_i < $input[item]
	else
		return value.to_i == $input[item]
	end
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
