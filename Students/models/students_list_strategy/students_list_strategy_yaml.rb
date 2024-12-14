require 'yaml'
require './models/entities/student.rb'
require './models/students_list_strategy/students_list_strategy.rb'

class Students_list_strategy_yaml < Students_list_strategy
    
    def read(file_path)
        content = YAML.safe_load(File.read(file_path), permitted_classes: [Date, Symbol])
        students = content.map { |student| Student.new(**student) }
    end

    def write(file_path, students)
        content = students.map { |student| student.to_h }
        File.write(file_path, content.to_yaml)
    end
end