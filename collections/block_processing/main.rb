require './collection_processing.rb'

def menu
    loop do
        puts("Выберите задачу:")
        puts("1 - Даны два массива. Найти количество совпадающих по значению элементов.")
        puts("2 - Найти количество минимальных элементов в интервале.")
        puts("3 - ")
        puts("4 -")
        puts("5 - ")
        puts("0 - Выход")

        print("Номер задачи: ")
        task = gets.chomp.to_i

        puts("\n\n")

        case task
        when 1
            display_count_matching_elements
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

        case selection
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
    puts("Массив: #{arr.join(' ')}")
    puts("\n\n")
    arr
end

def input_from_keyboard
    puts("Введите массив:")
    arr = gets.chomp.split.map(&:to_i)
end

def input_from_file
    puts("Введите путь к файлу:")
    path = gets.chomp

    if (path.nil?)
        raise ArgumentError, "path to file is nil"
    end

    if (!File.exist?(path))
        raise ArgumentError, "path to file does not exist"
    end

    File.open(path,'r') do |file|
      arr = file.read
      arr.split.map{|element| element.to_i}
    end
    arr
end

def display_count_matching_elements
    arr1 = input_selection
    arr2 = input_selection
    puts("Kоличество совпадающих по значению элементов: #{count_matching_elements(arr1,arr2)}")
end

menu