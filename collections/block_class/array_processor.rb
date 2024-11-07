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

    def min
        min_element = self.array.empty? ? nil : self.array.first

        self.array.each do |element|
            if (yield(element) < yield(min_value))
                min_element = element
            end
        end
        min_element
    end

    def take_while
        result = []
        self.array.each do |element|
            break unless yield(element)
            result << element
        end
        result
    end
        
    
    
    
    private

    attr_accessor :array

  
end