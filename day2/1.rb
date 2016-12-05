def keypadCode(instructionFile)
	code = ""
	keypad = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
	currCol = 1
	currRow = 1
	File.open(instructionFile).each do |instruction|
		instruction = instruction.split('')
		instruction.each do |direction|
			case direction
				when "U"
					currRow -= 1 if currRow > 0
				when "D"
					currRow += 1 if currRow < 2
				when "L"
					currCol -= 1 if currCol > 0
				when "R"
					currCol += 1 if currCol < 2
			end	
		end
		code += keypad[currRow][currCol].to_s
	end
	return code
end


puts "The example input should return 1985. It returns: " + keypadCode('example-input.txt')
puts "The real input returns: " + keypadCode('1-input.txt')
