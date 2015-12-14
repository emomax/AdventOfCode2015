#################
#   Pieslicer   #
#      2015     #
#################

## --- Day 14: Reindeer Olympics ---

# This year is the Reindeer Olympics! Reindeer 
# can fly at high speeds, but must rest occasionally 
# to recover their energy. Santa would like to 
# know which of his reindeer is fastest, and 
# so he has them race.

# Reindeer can only either be flying (always 
# at their top speed) or resting (not moving at 
# all), and always spend whole seconds in either 
# state.

# Given the descriptions of each reindeer (in your 
# puzzle input), after exactly 2503 seconds, what 
# distance has the winning reindeer traveled?

require 'rubygems'
require 'algorithms'

# ******* CLASSES ******* #

class Reindeer
	def initialize(name, speed, stamina, rest)
		@name = name
		@speed = speed
		@stamina = stamina
		@rest = rest
	end

	def getName
		return @name
	end

	def print
		puts @name + ': {speed: ' + @speed.to_s + ', stamina: ' + @stamina.to_s + ', rest: ' + @rest.to_s + '} -> ' + @distance.to_s
	end

	def setTimeToTravel(timeToTravel)
		@timeToTravel = timeToTravel
	end

	def howFar
		distance = 0
		flying = false
		internalIterator = 0
		timeTravelled = 0

		while timeTravelled <= @timeToTravel
			flying = !flying

			if flying
				timeTravelled = timeTravelled + @stamina
				distance = distance + @speed * @stamina
			else
				timeTravelled = timeTravelled + @rest
			end
		end

		if !flying
			@distance = distance
			return @distance
		end

		while timeTravelled > @timeToTravel
			distance = distance - @speed
			timeTravelled = timeTravelled - 1
		end

		@distance = distance
		return @distance
	end

end


# ****** FUNCTIONS ****** #

def parseRow(row)
	who, speed, duration, rest = row.match(/^([a-zA-Z]+) can fly (\d{1,3}) km\/s for (\d{1,2}) seconds, but then must rest for (\d{1,4}) seconds.$/).captures
	reindeer = Reindeer.new(who, speed.to_i, duration.to_i, rest.to_i)
	reindeer.setTimeToTravel (2503)

	$reindeers.push reindeer
	$pq.push(reindeer, reindeer.howFar.to_s)
end

# *** GLOBAL VARIABLES ** #
$reindeers = Array.new
$pq = Containers::PriorityQueue.new

# ******** BODY ********* #
file = File.new('input.txt', 'r')

while row = file.gets
	row.strip!
	parseRow(row)
end

while !$pq.empty?
	puts ($pq.next!).print
end
