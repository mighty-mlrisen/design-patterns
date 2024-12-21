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

    def clear_selected
        self.selected = []
    end

    def get_data
        index = 1
        data_table = [self.get_names]
        self.data.each do |selected|
            row = self.build_row(index,selected)
            data_table.append(row)
            index += 1
        end
        Data_table.new(data_table)
    end

    def data=(elements)
      @data = elements
    end

    def get_names
      raise NotImplementedError, "Not implemented"
    end 


    protected
    attr_reader :data
    attr_accessor :selected

    def build_row(index, obj)
      raise NotImplementedError, "Not implemented"
    end
end