#################
# 	Pieslicer   #
# 	  2015		#
#################

## --- Day 1, task 2: Not Quite Lisp ---

# Now, given the same instructions, find the position 
# of the first character that causes him to enter the 
# basement (floor -1). The first character in the instructions 
# has position 1, the second character has position 2, 
# and so on.

# What is the position of the character that causes 
# Santa to first enter the basement?

# ********* BODY ********** #

file = File.new("input.txt", "r")
instructions = file.gets

floor = 0
numberOfInstructions = 0
instructions.split("").each do |instruction|
	numberOfInstructions = numberOfInstructions + 1
	floor = instruction == ")" ? floor - 1 : floor + 1
	if floor == -1 
		break
	end
end

puts "Number of instructions to reach basement: " + numberOfInstructions.to_s
