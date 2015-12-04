#################
# 	Pieslicer   #
# 	  2015		#
#################

## --- Day 3, task 2: Perfectly Spherical Houses in a Vacuum ---

# The next year, to speed up the process, Santa creates a 
# robot version of himself, Robo-Santa, to deliver presents 
# with him.

# Santa and Robo-Santa start at the same location (delivering 
# two presents to the same starting house), then take turns 
# moving based on instructions from the elf, who is eggnoggedly 
# reading from the same script as the previous year.

# This year, how many houses receive at least one present?

# ********** BODY *********** #

file = File.new("input.txt", "r")
instructions = file.gets

santaX = 0
santaY = 0

roboX = 0
roboY = 0

santaMoving = true

houses = Hash.new(0)
houses[[santaX,santaY]] = 2

newX = 0
newY = 0

instructions.split("").each do |instruction|
	newX = 0
	newY = 0
	
	if (instruction == "^")
		newY = 1
	elsif (instruction == "v")
		newY = -1
	elsif (instruction == ">")
		newX = 1
	elsif (instruction == "<")
		newX = -1
	end

	if santaMoving == true
		santaX = santaX + newX
		santaY = santaY + newY
		houses[[santaX,santaY]] = houses[[santaX,santaY]] + 1
	else
		roboX = roboX + newX
		roboY = roboY + newY
		houses[[roboX,roboY]] = houses[[roboX,roboY]] + 1
	end

	santaMoving = !santaMoving
end

housesWithPresents = 0

houses.each do |coordinate, value|
	housesWithPresents = housesWithPresents + 1
end

puts "Houses with atleast one present with help from RoboSanta = " + housesWithPresents.to_s
