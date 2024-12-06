class Data_table

    def initialize(data)
        self.data = data
    end

    def get_element(row,col)
        unless (row >= 0 && row < self.row_count && col >= 0 && col < self.col_count)
            raise IndexError,'Index is out of range'
        end
        self.data[row][col]
    end

    def row_count
        self.data.size
    end

    def col_count
        self.data.empty? ? 0 : self.data[0].size
    end

    private
    attr_reader :data

    def data=(data)
        unless (data.is_a?(Array) && data.all? {|row| row.is_a?(Array)})
            raise ArgumentError 'Data must be a two-dimensional array'
        end
        @data = data
    end
end
