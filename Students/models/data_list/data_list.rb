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

    def get_names
        raise NotImplementedError, "Not implemented"
    end

    def get_data
        raise NotImplementedError, "Not implemented"
    end

    protected
    attr_reader :data
    attr_accessor :selected

    def data=(elements)
        @data = elements
    end
end