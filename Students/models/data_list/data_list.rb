class Data_list
    def initialize(elements)
        self.data = elements
    end

    private
    attr_reader :data

    def data=(elements)
        @data = elements

    end
end