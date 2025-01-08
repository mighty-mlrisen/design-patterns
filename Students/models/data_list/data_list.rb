class Data_list
    def initialize(elements, offset = 0)
        self.data = elements
        self.selected = []
        self.offset = offset
        self.observers = []
        self.count = 0
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

    def notify
        return if observers.nil?
        observers.each do |observer|
            observer.set_table_params(self.get_names, self.count)
            observer.set_table_data(self.get_data)
        end
    end

    def add_observer(observer)
        self.observers << observer
    end

    def data=(elements)
      @data = elements
    end

    def get_names
      raise NotImplementedError, "Not implemented"
    end 

    attr_accessor :count
    attr_writer :offset

    protected
    attr_reader :data, :offset
    attr_accessor :selected, :observers

    def build_row(index, obj)
      raise NotImplementedError, "Not implemented"
    end
end