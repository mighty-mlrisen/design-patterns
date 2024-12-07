require './models/data_list/data_list.rb'
require './models/data_table/data_table'

class Data_list_student_short < Data_list

    def get_names
      ["№", "full name", "git", "contact"]
    end

    private

    def build_row(index,data)
        [index, data.get_full_name, data.git, data.get_contact]
    end
end