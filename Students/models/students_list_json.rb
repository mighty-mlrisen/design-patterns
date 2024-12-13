require 'json'
require './models/entities/student.rb'
require './models/entities/student_short.rb'
require './models/data_list/data_list_student_short.rb'

class Students_list_JSON
    
    def initialize(file_path)
        self.file_path = file_path
        self.students = []
    end

    def read
        content = File.read(self.file_path)
        student_hashes = JSON.parse(content, symbolize_names: true)
        self.students = student_hashes.map do |student_hash|
            Student.new(**student_hash)
        end
    end

    def write
        content = self.students.map { |student| student.to_h }
        File.write(self.file_path, JSON.pretty_generate(content))
    end

    def get_student_by_id(id)
        self.students.find { |student| student.id == id }
    end

    def get_k_n_student_short_list(k, n, data_list = nil)
        start = (k - 1) * n
        selected = self.students[start, n] || []
        students_short = selected.map { |student| Student_short.init_with_student(student) }
        data_list = data_list || Data_list_student_short.new(students_short)
        data_list
    end

    def sort_by_full_name!
        self.students.sort_by! { |student| student.get_full_name }
    end

    def add_student(student)
        max_id = self.students.map(&:id).max || 0
        student.id = max_id + 1
        self.students << student
    end

    def replace_student(id, new_student)
        index = self.students.find_index { |student| student.id == id }
        raise IndexError, 'Student with this ID not found' unless index
        new_student.id = id
        self.students[index] = new_student
    end
  
    def delete_student(id)
        self.students.reject! { |student| student.id == id }
    end

    def get_student_short_count
        self.students.size
    end

    private
    attr_accessor :file_path, :students
end