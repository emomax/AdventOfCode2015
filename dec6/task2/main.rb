#################
# 	Pieslicer   #
# 	  2015      #
#################

## --- Day 6, part 2: Probably a Fire Hazard ---

# You just finish implementing your winning light
# pattern when you realize you mistranslated Santa's
# message from Ancient Nordic Elvish.

# The light grid you bought actually has individual
# brightness controls; each light can have a brightness
# of zero or more. The lights all start at zero.

# The phrase turn on actually means that you should
# increase the brightness of those lights by 1.

# The phrase turn off actually means that you should
# decrease the brightness of those lights by 1, to a
# minimum of zero.

# The phrase toggle actually means that you should
# increase the brightness of those lights by 2.

# What is the total brightness of all lights combined
# after following Santa's instructions?


# ******* GLOBAL VARS ******* #
$lightArray = Array.new(1000){Array.new(1000, 0)}

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
				$lightArray[localX][localY] = $lightArray[localX][localY] + 1
			elsif whatToDo == "turn off"
				# intensity must be zero or above
				if $lightArray[localX][localY] > 0
					$lightArray[localX][localY] = $lightArray[localX][localY] - 1
				end
			else
				$lightArray[localX][localY] = $lightArray[localX][localY] + 2
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
totalBrightness = 0
$lightArray.each do |row|
	row.each do |col|
		if col
			totalBrightness = totalBrightness + col
		end
	end
end

puts "Total brightness after instructions: " + totalBrightness.to_s
