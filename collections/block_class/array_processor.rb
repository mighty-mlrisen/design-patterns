class Array_processor

    def initialize(array)
        self.array = array.dup
    end

    def filter_map
        result = []
        self.array.each do |element|
            value = yield(element)
            if (value)
                result << element
            end
        end
        result
    end


    private

    attr_accessor :array

  
end