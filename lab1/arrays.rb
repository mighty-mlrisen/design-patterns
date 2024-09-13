# задание 5-6

def findMinElement(array) 
	minElement = array[0]
	for element in array 
		if (element < minElement)
			minElement = element
		end
	end
	return minElement
end


def findIndexOfFirstPositiveElement(array)
	index = 0
	while index < array.size
		if (array[index] > 0)
			return index
		end
		i += 1
	end
	return nil
end


def findIndexOfElement(array, value) 
	for index in (0...array.size)
		if (array[index] == value)
			return index
		end
	end
	return nil
end









