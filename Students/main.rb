require './student.rb'
require './student_short.rb'

def read_from_txt(path)
    if (path.nil?)
        raise ArgumentError, "path to file is nil"
    end

    if (!File.exist?(path))
        raise ArgumentError, "path to file does not exist"
    end

    students = Array.new

    File.open(path,'r') do |file|
        file.each_line do |line|
            student = Student.init_with_string(line.strip)
            students << student
        end
    end

    students
end

def write_to_txt(path,students)
    if (path.nil?)
        raise ArgumentError, "path to file is nil"
    end

    File.open(path,'w') do |file|
        students.each do |student|
            file.puts student.to_s.gsub("\n", ", ").gsub("-", "").chomp(", ")
        end
    end
end


student1 = Student.new(name: 'Artem',surname: 'Mazurenko', patronymic: 'Alekseevich',id: 1 , phone: '89096753487',telegram: '@skimaskway',email: 'mazurenko@yandex.ru',git: 'https://github.com/mighty-mlrisen')
student2 = Student.new(name: 'Vlad',surname: 'Solovyev', patronymic: 'Olegovich',id: 2, phone: '+7-(909)-578-45-73',telegram: '@mightygost',git: 'https://github.com/mightygost',email: 'vladsolovyev@yandex.ru')
student3 = Student.new(name: 'Ivan',surname: 'Vasuta', patronymic: 'Alekseevich',id: 3,git: 'https://github.com/lilgost')

puts student1
puts student2
puts student3

puts ("\n\n")

student1.set_contacts(phone: '89094574999')
puts student1

puts ("\n\n")

puts (student3.get_info)

puts ("\n\n")

student4 = Student_short.init_with_student(student1)
puts (student4.id)
puts (student4.get_full_name)
puts (student4.git)
puts (student4.get_contact)

puts ("\n\n")

student5 = Student_short.init_with_string(4, "full_name: Сергеев Н.А., git: https://github.com/krizfx, email: krizfx12@yandex.ru")
puts (student5.id)
puts (student5.get_full_name)
puts (student5.git)
puts (student5.get_contact)


puts ("\n\n")
student6 = Student.init_with_string("name: Anna, surname: Sergeeva, patronymic: Igorevna, id: 5, phone: 89096753487, telegram: @og12jjd, email: og12@yandex.ru, git: https://github.com/og-like")
puts student6

puts ("\n\n")

students = read_from_txt("students.txt")

students.each do |x|
    puts x.get_info
end

write_to_txt("students_write.txt",[student1,student2,student3])
