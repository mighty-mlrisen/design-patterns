def menu
    loop do
        puts("Выберите задачу:")
        puts("1 - Даны два массива. Найти количество совпадающих по значению элементов.")
        puts("2 -")
        puts("3 - ")
        puts("4 -")
        puts("5 - ")
        puts("0 - Выход")

        print("Номер задачи: ")
        task = gets.chomp.to_i

        puts("\n\n")

        case task
        when 1
            test
        when 0
            exit
        else
            puts("Задачи с номером #{task} не существует!")
        end
    end
end

def input_selection
    arr = []
    loop do
        puts("Выберите способ ввода данных:")
        puts("1 - с клавиатуры.")
        puts("2 - чтение из файла.")

        print("Номер способа: ")
        selection = gets.chomp.to_i

        case choice
        when 1
            arr = input_from_keyboard
            break
        when 2
            arr = input_from_file
            break
        else
          puts("Способа с номером #{selection} не существует!")
        end
    end
end

menu