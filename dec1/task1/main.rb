#################
# 	Pieslicer   #
# 	  2015		#
#################

## --- Day 1, task 1: Not Quite Lisp ---

# Santa is trying to deliver presents in a 
# large apartment building, but he can't find 
# the right floor - the directions he got are 
# a little confusing. He starts on the ground 
# floor (floor 0) and then follows the instructions 
# one character at a time.

# An opening parenthesis, (, means he should go 
# up one floor, and a closing parenthesis, ), 
# means he should go down one floor.

# The apartment building is very tall, and the 
# basement is very deep; he will never find the 
# top or bottom floors.

# To what floor do the instructions take Santa?


# ******** BODY ********* #

file = File.new("input.txt", "r")
instructions = file.gets

floor = 0
instructions.split("").each do |instruction|
	floor = instruction == ")" ? floor - 1 : floor + 1
end

puts "Santa ends up on floor: " + floor.to_s
