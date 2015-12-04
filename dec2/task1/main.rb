#################
# 	Pieslicer   #
# 	  2015		#
#################

## --- Day 2, task 1: I Was Told There Would Be No Math ---

# The elves are running low on wrapping paper, and so they 
# need to submit an order for more. They have a list of the 
# dimensions (length l, width w, and height h) of each present, 
# and only want to order exactly as much as they need.

# Fortunately, every present is a box (a perfect right rectangular 
# prism), which makes calculating the required wrapping paper for 
# each gift a little easier: find the surface area of the box, which 
# is 2*l*w + 2*w*h + 2*h*l. The elves also need a little extra paper 
# for each present: the area of the smallest side.

# All numbers in the elves' list are in feet. How many total square 
# feet of wrapping paper should they order?


# ************ FUNCTIONS ************ #

def parsePresent(line)
	return line.split("x")
end

def amountOfPaperPerPresent(presentDimensions)
	w = presentDimensions.at(0).to_i
	h = presentDimensions.at(1).to_i
	l = presentDimensions.at(2).to_i

	bottom = w*l
	longSide = l*h
	shortSide = w*h

	min = longSide < bottom ? longSide : bottom
	min = shortSide < min ? shortSide : min

	return 2*bottom + 2*longSide + 2*shortSide + min
end

# ************ BODY ************ #

file = File.new("input.txt", "r")

amountOfPaper = 0
while present = file.gets
	amountOfPaper = amountOfPaper + amountOfPaperPerPresent(parsePresent(present))
end

puts "Amount of paper required for all presents: " + amountOfPaper.to_s