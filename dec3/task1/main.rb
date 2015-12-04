#################
# 	Pieslicer   #
# 	  2015		#
#################

## --- Day 3, task 1: Perfectly Spherical Houses in a Vacuum ---

# Santa is delivering presents to an infinite two-dimensional grid of houses.

# He begins by delivering a present to the house at his starting location, and 
# then an elf at the North Pole calls him via radio and tells him where to move 
# next. Moves are always exactly one house to the north (^), south (v), east (>), 
# or west (<). After each move, he delivers another present to the house at his 
# new location.

# However, the elf back at the north pole has had a little too much eggnog, and
# so his directions are a little off, and Santa ends up visiting some houses more
# than once. How many houses receive at least one present?


# ********** BODY *********** #

file = File.new("input.txt", "r")
instructions = file.gets

x = 0
y = 0

houses = Hash.new(0)
houses[[x,y]] = 1

instructions.split("").each do |instruction|
	if (instruction == "^")
		y = y + 1
	elsif (instruction == "v")
		y = y - 1
	elsif (instruction == ">")
		x = x + 1
	elsif (instruction == "<")
		x = x - 1
	end

	houses[[x,y]] = houses[[x,y]] + 1
end

housesWithPresents = 0

houses.each do |coordinate, value|
	housesWithPresents = housesWithPresents + 1
end

puts "Houses with atleast one present = " + housesWithPresents.to_s
