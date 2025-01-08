require './views/student_list_view.rb'

class Student_list_controller

    def initialize(view, students_list)
        self.view = view
        self.students_list = students_list
    end

    def refresh_data
        self.students_list.get_k_n_student_short_list(1, self.students_list.get_student_short_count).get_data
    end

    private
    attr_accessor :view, :students_list

end