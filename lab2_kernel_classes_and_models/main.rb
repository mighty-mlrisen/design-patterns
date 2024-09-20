require './student.rb'

student1 = Student.new(name: 'Artem', surname: 'Mazurenko', patronymic: 'Alekseevich',id: 1 , phone: '89096753487',telegram: '@skimaskway',email: 'mazurenko@yandex.ru',git: 'https://github.com/mighty-mlrisen')
student2 = Student.new(name: 'Vlad',surname: 'Solovyev', patronymic: 'Olegovich',id: 2, phone: '+7-(909)-578-45-73',telegram: '@mightygost',git: 'https://github.com/mightygost',email: 'vladsolovyev@yandex.ru')
student3 = Student.new(name: 'Ivan',surname: 'Vasuta', patronymic: 'Alekseevich',id: 3,git: 'https://github.com/lilgost')

student1.print_info
student2.print_info
student3.print_info

