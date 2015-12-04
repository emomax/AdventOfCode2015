#################
# 	Pieslicer   #
# 	  2015		#
#################

## --- Day 2, task 2: I Was Told There Would Be No Math ---

# The elves are also running low on ribbon. Ribbon is all the 
# same width, so they only have to worry about the length they 
# need to order, which they would again like to be exact.

# The ribbon required to wrap a present is the shortest 
# distance around its sides, or the smallest perimeter of 
# any one face. Each present also requires a bow made out 
# of ribbon as well; the feet of ribbon required for the 
# perfect bow is equal to the cubic feet of volume of the 
# present. Don't ask how they tie the bow, though; they'll never tell.

# How many total feet of ribbon should they order?


# ************ FUNCTIONS ************ #

def parsePresent(line)
	return line.split("x")
end

def amountOfRibbonPerPresent(presentDimensions)
	w = presentDimensions.at(0).to_i
	h = presentDimensions.at(1).to_i
	l = presentDimensions.at(2).to_i

	minSide1 = w < h ? w : h
	minSide2 = l <= minSide1 ? l : ((minSide1 == w) ? (l <= h ? l : h) : (l <= w ? l : w))

	return minSide1*2 + minSide2*2 + w * h * l
end

# ************ BODY ************ #

file = File.new("input.txt", "r")

amountOfRibbon = 0
while present = file.gets
	amountOfRibbon = amountOfRibbon + amountOfRibbonPerPresent(parsePresent(present))
end

puts "Total length of ribbon required for all presents: " + amountOfRibbon.to_s