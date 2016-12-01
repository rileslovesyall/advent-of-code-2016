require 'pry'

EXAMPLE_ONE = "R2, L3"
ANSWER_ONE = 5
EXAMPLE_TWO = "R2, R2, R2"
ANSWER_TWO = 2
EXAMPLE_THREE = "R5, L5, R5, R3"
ANSWER_THREE = 12

INPUT = "L3, R1, L4, L1, L2, R4, L3, L3, R2, R3, L5, R1, R3, L4, L1, L2, R2, R1, L4, L4, R2, L5, R3, R2, R1, L1, L2, R2, R2, L1, L1, R2, R1, L3, L5, R4, L3, R3, R3, L5, L190, L4, R4, R51, L4, R5, R5, R2, L1, L3, R1, R4, L3, R1, R3, L5, L4, R2, R5, R2, L1, L5, L1, L1, R78, L3, R2, L3, R5, L2, R2, R4, L1, L4, R1, R185, R3, L4, L1, L1, L3, R4, L4, L1, R5, L5, L1, R5, L1, R2, L5, L2, R4, R3, L2, R3, R1, L3, L5, L4, R3, L2, L4, L5, L4, R1, L1, R5, L2, R4, R2, R3, L1, L1, L4, L3, R4, L3, L5, R2, L5, L1, L1, R2, R3, L5, L3, L2, L1, L4, R4, R4, L2, R3, R1, L2, R1, L2, L2, R3, R3, L1, R4, L5, L3, R4, R4, R1, L2, L5, L3, R1, R4, L2, R5, R4, R2, L5, L3, R4, R1, L1, R5, L3, R1, R5, L2, R1, L5, L2, R2, L2, L3, R3, R3, R1"

def shortestPath(input)
	cardinalDirections = ["N", "E", "S", "W"]
	
	instructionArray = input.split(', ')
	startPosition = [0,0];
	currPosition = [0,0]
	for instruction in instructionArray
		instructionCopy = instruction
		movementDirection = instructionCopy[0];
		instructionCopy.slice!(0)
		numSteps = instructionCopy.to_i
		# changing direction based on whether we are turning right or left
		if movementDirection == 'R'
			cardinalDirections = cardinalDirections.rotate
		else 
			cardinalDirections = cardinalDirections.rotate(-1)
		end
		# reset current Direction
		currDirection = cardinalDirections[0];
		# move position counter based on which direction we are facing
		if currDirection == 'N'
			currPosition[0] += numSteps;
		elsif currDirection == 'E'
			currPosition[1] += numSteps;
		elsif currDirection == 'S'
			currPosition[0] -= numSteps;
		elsif currDirection == 'W'
			currPosition[1] -= numSteps;
		end
	end
	# now figure out current position from starting position
	blocksAway = currPosition[0].abs + currPosition[1].abs
	return blocksAway.to_s
end

puts "The first example should return 5. It returns: " + shortestPath(EXAMPLE_ONE)
puts "The second example should return 2. It returns: " + shortestPath(EXAMPLE_TWO)
puts "The third example should return 12. It returns: " + shortestPath(EXAMPLE_THREE)
puts "The real test input returns: " + shortestPath(INPUT)
