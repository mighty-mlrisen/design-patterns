require './student.rb'

student1 = Student.new('Artem','Mazurenko','Alekseevich',1,'89096753487','skimaskway',nil,'https://github.com/mighty-mlrisen')
student2 = Student.new('Vlad','Solovyev','Olegovich',2,'89098945623','mightygost','vladsolovyev@yandex.ru','https://github.com/mightygost')
student3 = Student.new('Ivan','Vasuta','Alekseevich',3,'89097843567',nil,'vasuta23@yandex.ru','https://github.com/lilgost')

student1.print_info
student2.print_info
student3.print_info
