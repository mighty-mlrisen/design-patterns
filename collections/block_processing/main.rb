require './collection_processing.rb'

def menu
    loop do
        puts("Выберите задачу:")
        puts("1 - Даны два массива. Найти количество совпадающих по значению элементов.")
        puts("2 - Найти количество минимальных элементов в интервале.")
        puts("3 - Найти элементы, значение которых принадлежит отрезку.")
        puts("4 - Вывести вначале положительные элементы, а затем - отрицательные.")
        puts("5 - ")
        puts("0 - Выход")

        print("Номер задачи: ")
        task = gets.chomp.to_i

        puts("\n\n")

        case task
        when 1
            display_count_matching_elements
        when 2
            display_count_min_in_interval
        when 3
            display_find_elements_in_segment
        when 4
            display_sorted_by_sign
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

def display_count_min_in_interval
    arr = input_selection
    print("Введите начало интервала: ")
    a = gets.chomp.to_i
    print("Введите конец интервала: ")
    b = gets.chomp.to_i
    puts("Kоличество минимальных элементов в интервале #{a}..#{b}: #{count_min_in_interval(arr,a,b)}")
end

def display_find_elements_in_segment
    arr = input_selection
    print("Введите начало интервала: ")
    a = gets.chomp.to_i
    print("Введите конец интервала: ")
    b = gets.chomp.to_i
    puts("Элементы, значение которых принадлежит отрезку #{a}..#{b}: #{find_elements_in_segment(arr,a,b).join(' ')}")
end

def display_sorted_by_sign
    arr = input_selection
    puts("Отсортированный массив по знаку: #{sorted_by_sign(arr).join(' ')}")
end


menu