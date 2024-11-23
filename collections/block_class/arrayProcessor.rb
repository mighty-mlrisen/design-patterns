class ArrayProcessor

    def initialize(array)
        self.array = array.dup
    end

    def get_element(index)
		self.array[index]
	end

    def filter_map
        result = []
        self.array.each do |element|
            value = yield(element)
            if (value)
                result << value
            end
        end
        result
    end

    def min
        min_element = self.array.empty? ? nil : self.array.first

        self.array.each do |element|
            if (yield(element) < yield(min_element))
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
        
    def partition
        array_1 = []
        array_2 = []
        self.array.each do |element|
            if (yield(element))
                array_1 << element
            else
                array_2 << element
            end
        end
        [array_1,array_2]
    end

    def group_by
        result = {}
        self.array.each do |element|
            key = yield(element)
            result[key] ? result[key] << element : result[key] = [element]
        end
        result
    end

    def count
        result = 0
        self.array.each do |element|
            if (yield(element))
                result += 1
            end
        end
        result
    end
    
    private
    attr_accessor :array
end