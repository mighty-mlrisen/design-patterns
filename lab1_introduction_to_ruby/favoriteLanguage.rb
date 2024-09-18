# задание 2-3

if (ARGV.length != 0)
	username = ARGV[0]
	puts ("Hellow, #{username}!")

	puts ("Какой твой любимый язык программирования ?\n\n")

	language = $stdin.gets.chomp
	puts ("\n")

	case language
		when 'ruby'
			puts ("#{username} - ты подлиза!")
		when 'java'
			puts ("Скоро будет ruby!")
		when 'python'
			puts ("Ничего, скоро будет ruby!")
		else 
			puts ("Всё равно скоро будет ruby!")
	end

	puts ("\n")

	puts ("Введите команду ruby!")

	ruby_command = $stdin.gets.chomp

	begin 
		result = eval (ruby_command)

		puts "\n\nРезультат выполнения команды Ruby: #{result}"

	rescue StandardError => e

    	puts "Ошибка выполнения команды Ruby: #{e.message}"
    end

	puts ("\n\nВведите команду ОС!")

	
	os_command = $stdin.gets.chomp

	puts ("\n")

	if (system (os_command))
		puts "\n\nКоманда ОС выполнена успешно."
	else 
		puts "Ошибка при выполнении команды ОС."
	end

else
	puts ("Введите имя в аргументе программы!")
end