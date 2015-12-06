#################
# 	Pieslicer   #
# 	  2015      #
#################

## --- Day 6, part 1: Probably a Fire Hazard ---

# Because your neighbors keep defeating you in the
# holiday house decorating contest year after year,
# you've decided to deploy one million lights in a
# 1000x1000 grid.

# Furthermore, because you've been especially nice
# this year, Santa has mailed you instructions on
# how to display the ideal lighting configuration.

# Lights in your grid are numbered from 0 to 999 in
# each direction; the lights at each corner are at
# 0,0, 0,999, 999,999, and 999,0. The instructions
# include whether to turn on, turn off, or toggle
# various inclusive ranges given as coordinate pairs.
# Each coordinate pair represents opposite corners of
# a rectangle, inclusive; a coordinate pair like 0,0
# through 2,2 therefore refers to 9 lights in a 3x3
# square. The lights all start turned off.

# To defeat your neighbors this year, all you have to
# do is set up your lights by doing the instructions
# Santa sent you in order.

# After following the instructions, how many lights are lit?


# ******* GLOBAL VARS ******* #
$lightArray = Array.new(1000){Array.new(1000, false)}

# ******** FUNCTIONS ******** #

def parseInstruction(instruction)
	# Get data from instruction row
	whatToDo, fromPosX, fromPosY, toPosX, toPosY = instruction.match(/(turn on|turn off|toggle) (\d{1,3}),(\d{1,3}) through (\d{1,3}),(\d{1,3})/i).captures

	localX = fromPosX.to_i
	localY = fromPosY.to_i
	orderX = 1
	orderY = 1

	# allow any order of input coordinates
	if (fromPosX.to_i > toPosX.to_i)
		orderX = -1
	end
	if (fromPosY.to_i > toPosY.to_i)
		orderY = -1
	end

	# parse range specified
	while localX != toPosX.to_i + orderX
		localY = fromPosY.to_i

		while localY != toPosY.to_i + orderY
			if whatToDo == "turn on"
				$lightArray[localX][localY] = true
			elsif whatToDo == "turn off"
				$lightArray[localX][localY] = false
			else
				$lightArray[localX][localY] = !$lightArray[localX][localY]
			end

			localY = localY + orderY
		end
		localX = localX + orderX
	end
end

# ********** BODY *********** #

puts "Begin parsing and executing instructions.. (this could take a few seconds)"

file = File.new("input.txt", "r")
while instruction = file.gets
	parseInstruction(instruction)
end
file.close()

puts ".. Done.\n"

# count lights
lightsLitAfterInstructions = 0
$lightArray.each do |row|
	row.each do |col|
		if col
			lightsLitAfterInstructions = lightsLitAfterInstructions + 1
		end
	end
end

puts "Amount of lights lit after instructions: " + lightsLitAfterInstructions.to_s
