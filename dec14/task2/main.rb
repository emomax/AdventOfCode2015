#################
#   Pieslicer   #
#      2015     #
#################

## --- Day 14, task 2: Reindeer Olympics ---

# Seeing how reindeer move in bursts, Santa
# decides he's not pleased with the old
# scoring system.

# Instead, at the end of each second, he awards
# one point to the reindeer currently in the lead.
# (If there are multiple reindeer tied for the
# lead, they each get one point.) He keeps
# the traditional 2503 second time limit, of
# course, as doing otherwise would be entirely
# ridiculous.

# Given the example reindeer from above, after
# the first second, Dancer is in the lead and
# gets one point. He stays in the lead until
# several seconds into Comet's second burst:
# after the 140th second, Comet pulls into the
# lead and gets his first point. Of course, since
# Dancer had been in the lead for the 139 seconds
# before that, he has accumulated 139 points by
# the 140th second.

require 'rubygems'
require 'algorithms'

# ******* CLASSES ******* #

class Reindeer
	# constructor
	def initialize(name, speed, stamina, rest)
		@name = name
		@speed = speed
		@stamina = stamina
		@rest = rest

		@isFlying = true
		@distance = 0
		@timeTravelled = 0
		@points = 0
		@nextTimeToRestOrFly = @stamina
		@timePassed = 0
	end

	# Award this reindeer for excellent flying
	def givePoint
		@points = @points + 1
	end

	def getName
		return @name
	end

	# move this reindeer forth one second
	def moveForth
		@timePassed += 1
		if @timePassed > @nextTimeToRestOrFly
			@isFlying = !@isFlying
			@nextTimeToRestOrFly += @isFlying ? @stamina : @rest
		end
		@distance += @isFlying ? @speed : 0
	end

	# return distance this reindeer has travelled
	def getDistance
		return @distance
	end

	# return points this reindeer holds
	def getPoints
		return @points
	end

	# Output reindeer data
	def print
		puts @name + ': {speed: ' + @speed.to_s + ', stamina: ' + @stamina.to_s + ', rest: ' + @rest.to_s + '} -> ' + @points.to_s
	end
end


# ****** FUNCTIONS ****** #

def parseRow(row)
	who, speed, duration, rest = row.match(/^([a-zA-Z]+) can fly (\d{1,3}) km\/s for (\d{1,2}) seconds, but then must rest for (\d{1,4}) seconds.$/).captures
	reindeer = Reindeer.new(who, speed.to_i, duration.to_i, rest.to_i)

	$reindeers.push reindeer
end

# *** GLOBAL VARIABLES ** #
$reindeers = Array.new
$internalQueue = Containers::PriorityQueue.new
$pq = Containers::PriorityQueue.new


# ******** BODY ********* #
 file = File.new('input.txt', 'r')

# Save reindeer data
while row = file.gets
#["Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.", "Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds."].each do |row|
	row.strip!
	parseRow(row)
end

file.close

# Collect points
(1..2503).each do |i|
	$internalQueue.clear
	highestDist = 0

	$reindeers.each do |reindeer|
		reindeer.moveForth
		$internalQueue.push(reindeer, reindeer.getDistance)
	end

	reindeer = $internalQueue.next!
	reindeer.givePoint
	currDistance = reindeer.getDistance

	# All the leaders get a point!
	while (!$internalQueue.empty? and ($internalQueue.next).getDistance == currDistance)
		reindeer = $internalQueue.next!
		reindeer.givePoint
	end
end

# Sort according to points
$reindeers.each do |reindeer|
	$pq.push(reindeer, reindeer.getPoints)
end

while !$pq.empty?
	puts ($pq.next!).print
end
