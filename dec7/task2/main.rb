#################
#   Pieslicer   #
#      2015     #
#################

## --- Day 7, task 2: Some Assembly Required ---

# Now, take the signal you got on wire a, override
# wire b to that signal, and reset the other wires
# (including wire a). What new signal is ultimately
# provided to wire a?


# ***** GLOBAL VARS ***** #
$wires = Hash.new
$visited = Hash.new

# ****** FUNCTIONS ****** #

def parseInstruction(key, depth)
	instructions = $wires[key]

	# cached value exists, use that instead of calculating everything again
	if $visited.has_key? key
		return $visited[key]
	end

	# reached a leaf, '10 -> a'
	if instructions.match /^[0-9]+$/
		$visited[key] = instructions.to_i
		return $visited[key]
	end

	# direct coupling to other wire or component, 'a -> b'
	if instructions.match /^[a-z]{1,2}$/
		$visited[key] = parseInstruction(instructions.to_s, depth + 1)
		return $visited[key]
	end

	# if we reach here we have some operators going on. Parse them along with
	# right-hand side of instruction
	firstGroup, secondGroup = instructions.match(/(NOT [a-z0-9]{1,2}|[a-z0-9]{1,2} )(AND [a-z]{1,2}|OR [a-z]{1,2}|RSHIFT \d+|LSHIFT \d+)?$/).captures

	# NOT gate
	if firstGroup.to_s.start_with? ("NOT ")
		$visited[key] = ~parseInstruction((firstGroup.to_s.gsub! 'NOT ', ''), depth+1)
		return $visited[key]
	end

	# normalize key values
	firstNextKey = firstGroup.to_s.gsub! ' ', ''
	operation, secondNextKey = secondGroup.to_s.match(/(AND|OR|RSHIFT|LSHIFT) ([a-z0-9]{1,2})/).captures

	case operation.to_s
	when "AND"
		# left-hand side of input can be digits and we should in that case
		# not try to access that in our map
		if firstNextKey.match /^[0-9]+$/
			$visited[key] = firstNextKey.to_i & parseInstruction(secondNextKey.to_s, depth+1)
			return $visited[key]
		end

		$visited[key] = parseInstruction(firstNextKey.to_s, depth+1) & parseInstruction(secondNextKey.to_s, depth+1)
	when "OR"
		$visited[key] = parseInstruction(firstNextKey.to_s, depth+1) | parseInstruction(secondNextKey.to_s, depth+1)
	when "RSHIFT"
		$visited[key] = parseInstruction(firstNextKey.to_s, depth+1) >> secondNextKey.to_i
	when "LSHIFT"
		$visited[key] = parseInstruction(firstNextKey.to_s, depth+1) << secondNextKey.to_i
	else
		puts "Unexpected operation! Found '" + operation.to_s + "'"
	end

	return $visited[key]
end

# map component against wires connected to it
def hashInstructions(instruction)
	value, key = instruction.match(/(.+) \-\> ([a-z]{1,2})/).captures
	$wires[key.to_s] = value.to_s
end

# ******** BODY ********* #

file = File.new("input.txt", "r")
while instruction = file.gets
	hashInstructions(instruction)
end
file.close

# adjust signal b to a from previous task
$wires["b"] = "16076"

valueA = parseInstruction("a", 0)

puts "Value of wire (a) with new (b)-value: " + valueA.to_s
