class Data_list
    def initialize(elements)
        self.data = elements
        self.selected = []
    end

    def select(number)
        unless (number >= 0 && number < self.data.size)
            raise IndexError,'Index is out of range'
        end
        self.selected << number unless self.selected.include?(number)
    end

    def get_selected
        self.selected.dup
    end

    def get_data
        index = 1
        data_table = [self.get_names]
        selected = self.get_selected
        selected.each do |selected_index|
            data = self.data[selected_index]
            row = self.build_row(index,data)
            data_table.append(row)
            index += 1
        end
        Data_table.new(data_table)
    end

    def get_names
      raise NotImplementedError, "Not implemented"
    end

    protected
    attr_reader :data
    attr_accessor :selected

    def data=(elements)
        @data = elements
    end

    def build_row(index, obj)
      raise NotImplementedError, "Not implemented"
    end
end