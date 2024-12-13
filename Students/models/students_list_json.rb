require 'json'
require './models/entities/student.rb'
require './models/students_list/students_list.rb'

class Students_list_JSON < Students_list
    
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
end