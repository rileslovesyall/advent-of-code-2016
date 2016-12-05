def validTriangle(sidesFile)
	validTriangleCount = 0
	File.open(sidesFile).each do |sides|
		sidesArray = sides.split(" ")
		s1 = sidesArray[0].to_i
		s2 = sidesArray[1].to_i
		s3 = sidesArray[2].to_i
		if s1 + s2 > s3 && s2 + s3 > s1 && s1 + s3 > s2
			validTriangleCount += 1
		end
	end
	return validTriangleCount.to_s
end

puts "The example input should return 0. It returns: " + validTriangle('example-input.txt')
puts "The real input returns: " + validTriangle('1-input.txt')