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
		index += 1
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



def load_array_from_file(path)
	File.open(path) do |file|
		array = file.read
		array.split.map{|element| element.to_i}
	end
end


if (ARGV.size < 2)
	puts ("Необходимо ввести 2 значения: номер метода и адрес файла")
else
	array = load_array_from_file(ARGV[1])

	puts("Массив: #{array.join(' ')}")

	case ARGV[0].to_i
		when 1
			puts("\nМинимальный элемент массива: #{findMinElement(array)}")
		when 2
			puts("\nИндекс первого положительного элемента массива: #{findIndexOfFirstPositiveElement(array)}")
		when 3
			puts("Введите значение для поиска")
			value = $stdin.gets.chomp.to_i
			res3 = findIndexOfElement(array,value)
			if (res3.nil?)
				puts("\nМассив не содержит введённое значение")
			else
				puts("\nИндекс введённого значения: #{res3}")
			end
		else
			puts("Неверный номер метода")
	end
end

