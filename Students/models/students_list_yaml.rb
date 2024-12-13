require 'yaml'
require './models/entities/student.rb'
require './models/students_list/students_list.rb'

class Students_list_YAML < Students_list

    def read
        content = YAML.safe_load(File.read(self.file_path), permitted_classes: [Date, Symbol])
        self.students = content.map { |student| Student.new(**student) }
    end

    def write
        content = self.students.map { |student| student.to_h }
        File.write(self.file_path, content.to_yaml)
    end
end