#################
#   Pieslicer   #
#      2015     #
#################

## --- Day 12: JSAbacusFramework.io ---

# Santa's Accounting-Elves need help balancing 
# the books after a recent order. Unfortunately, 
# their accounting software uses a peculiar 
# storage format. That's where you come in.

# They have a JSON document which contains a 
# variety of things: arrays ([1,2,3]), objects 
# ({"a":1, "b":2}), numbers, and strings. Your 
# first job is to simply find all of the numbers 
# throughout the document and add them together.

# You will not encounter any strings containing 
# numbers.

# What is the sum of all numbers in the document?


# ****** FUNCTIONS ****** #
def parseRow(row)
	sum = 0
	stuff = row.scan /-?\d+/
	stuff.each do |digit|
		sum += digit.to_i
	end
	return sum
end

# *** GLOBAL VARIABLES ** #
$sum = 0

# ******** BODY ********* #
file = File.new('input.txt', 'r')

while row = file.gets
	row.strip!
	$sum += parseRow(row)
end
puts 'All numbers in input combined is: ' + $sum.to_s
