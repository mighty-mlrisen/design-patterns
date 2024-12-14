require 'pg'
require './models/entities/student.rb'
require './models/entities/student_short.rb'
require './models/data_list/data_list_student_short.rb'

class Students_list_DB

    def initialize(db_config)
        self.db = PG.connect(db_config)
    end

    def get_student_by_id(id)
        result = self.db.exec_params("SELECT * FROM student WHERE id = $1", [id])
        row = result.first
        if (!row)
            return nil
        end
        Student.init_with_hash(row)
    end

    def get_k_n_student_short_list(k, n, data_list = nil)
        start = (k - 1) * n
        selected = self.db.exec_params("SELECT * FROM student LIMIT $1 OFFSET $2", [n, start])
        students_short = selected.map { |row| Student_short.init_with_student(Student.init_with_hash(row)) }
        data_list = data_list || Data_list_student_short.new(students_short)
        data_list
    end

    def add_student(student)
      result = self.db.exec_params(
        "INSERT INTO student (surname, name, patronymic, git, email, telegram, phone, birthdate) 
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id",
        [
            student.surname, student.name, student.patronymic, student.git, student.email,
            student.telegram, student.phone, student.birthdate
        ]
      )
    end

    def replace_student(id, new_student)
      result = self.db.exec_params(
        "UPDATE student SET surname = $1, name = $2, patronymic = $3, git = $4, email = $5, 
        telegram = $6, phone = $7, birthdate = $8 WHERE id = $9",
        [
            new_student.surname, new_student.name, new_student.patronymic, new_student.git, 
            new_student.email, new_student.telegram, new_student.phone, new_student.birthdate, id
        ]
      )
      raise "Студент с ID #{id} не найден" if result.cmd_tuples == 0
    end

    def delete_student(id)
      result = self.db.exec_params("DELETE FROM student WHERE id = $1", [id])
      raise "Студент с ID #{id} не найден" if result.cmd_tuples == 0
    end

    def get_student_short_count
      result = self.db.exec("SELECT COUNT(*) FROM student")
      result[0]['count'].to_i
    end

    private
    attr_accessor :db
end