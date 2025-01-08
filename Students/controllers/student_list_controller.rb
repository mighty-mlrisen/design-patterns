require './views/student_list_view.rb'
require './models/students_list/students_list.rb'
require './models/data_list/data_list_student_short.rb'

class Student_list_controller

    def initialize(view)
        self.view = view
        begin
          self.students_list = Students_list.new('./students.json',Students_list_strategy_json.new())
          self.students_list.read
          self.data_list = Data_list_student_short.new([])
          self.data_list.add_observer(self.view)
        rescue StandardError => e
          self.view.show_error_message("Error accessing data: #{e.message}")
      end
    end

    def refresh_data
        self.students_list.get_k_n_student_short_list(self.view.current_page, self.view.items_per_page - 1, self.data_list)
        self.data_list.count = self.students_list.get_student_short_count
        self.data_list.notify
    end

    def sort_table_by_column
        self.students_list.sort_by_full_name!
        self.data_list.notify
    end

    private
    attr_accessor :view, :students_list, :data_list

end