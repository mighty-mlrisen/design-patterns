# задание 4. Вариант 10

def isCoprime(number1, number2) 
	while (number2 != 0)
    	temp = number1 
    	number1 = number2  
    	number2 = temp % number2 
  	end

  	if (number1 == 1) 
  		return true
  	end

  	return false

end


def countNonCoprimeEvenNumbers(number)

	count = 0

	(2..number).each do |i|
		if (isCoprime(i,number) == false && i % 2 == 0)
			count += 1
		end
	end

	return count
end

puts ("Введите число: ")
number1 = $stdin.gets.chomp.to_i
puts ("Количество четных чисел, не взаимно простых с данным: #{countNonCoprimeEvenNumbers(number1)}\n\n")



