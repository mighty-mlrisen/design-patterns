
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

else
	puts ("Введите имя в аргументе программы!")
end