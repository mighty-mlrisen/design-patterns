require './student.rb'

student1 = Student.new(name: 'Artem', surname: 'Mazurenko', patronymic: 'Alekseevich',id: 1 , phone: '89096753487',telegram: '@skimaskway',email: 'mazurenko@yandex.ru',git: 'https://github.com/mighty-mlrisen')
student2 = Student.new(name: 'Vlad',surname: 'Solovyev', patronymic: 'Olegovich',id: 2, phone: '+7-(909)-578-45-73',telegram: '@mightygost',git: 'https://github.com/mightygost',email: 'vladsolovyev@yandex.ru')
student3 = Student.new(name: 'Ivan',surname: 'Vasuta', patronymic: 'Alekseevich',id: 3,git: 'https://github.com/lilgost')

student1.print_info
student2.print_info
student3.print_info

#student1.set_contacts(phone: '89094574587')
#student1.print_info

#puts (student3.get_info)

student4 = Student_short.init_with_student(student1)
puts (student4.id)
puts (student4.full_name)
puts (student4.git)
puts (student4.contact)

student5 = Student_short.init_with_string(4, "full_name: Сергеев Н.А., git: https://github.com/krizfx, email: krizfx12@yandex.ru")
puts (student5.id)
puts (student5.full_name)
puts (student5.git)
puts (student5.contact)