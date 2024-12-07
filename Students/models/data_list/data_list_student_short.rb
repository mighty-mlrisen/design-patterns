require './models/data_list/data_list.rb'
require './models/data_table/data_table'

class Data_list_student_short < Data_list

    def get_names
      ["№", "full name", "git", "contact"]
    end

    def get_data 
        index = 1
        data_table = [self.get_names]
        selected = self.get_selected
        selected.each do |selected_index|
            data = self.data[selected_index]
            row = [index, data.get_full_name, data.git, data.get_contact]
            data_table.append(row)
            index += 1
        end
        Data_table.new(data_table)
    end
end