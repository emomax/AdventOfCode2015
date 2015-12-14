#################
#   Pieslicer   #
#      2015     #
#################

## --- Day 9: All in a Single Night ---

# Every year, Santa manages to deliver all of 
# his presents in a single night.

# This year, however, he has some new
# locations to visit; his elves have provided 
# him the distances between every pair of 
# locations. He can start and end at any two 
# (different) locations he wants, but he must 
# visit each location exactly once. What is 
# the shortest distance he can travel to achieve this?

require 'rubygems'
require 'algorithms'

# ******* CLASSES ******* #

class Node
	attr_accessor :distance, :name
	def initialize(name)
		@name = name
		@distance = 999999999
	end

	def getName
		return @name
	end
end

# ****** FUNCTIONS ****** #

def parseRow(row)
	puts row
end

# *** GLOBAL VARIABLES ** #

$nodes = Array.new
$unsettledNodes = Array.new
$settledNodes = Array.new

$pq = Containers::PriorityQueue.new

# ******** BODY ********* #

distance = 0

$nodes.push(Node.new("London"))
$nodes.push(Node.new("Dublin"))
$nodes.push(Node.new("Belfast"))

$unsettledNodes.push($nodes[0])
$unsettledNodes[0].distance = 0

while $unsettledNodes.length != 0

end
#
#file = File.new("input.txt", "rb")
#while row = file.gets# and $line < 30
#	row.strip!
#
#	parseRow(row)
#end
#file.close


puts "Shortest distance needed to travel: " + distance.to_s
