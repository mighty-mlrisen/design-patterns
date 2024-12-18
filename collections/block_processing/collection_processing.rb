def count_matching_elements(arr1, arr2)
    arr1.count { |element| arr2.include?(element) }
end

def count_min_in_interval(arr, a, b)
    interval_elements = arr.select { |num| (a..b).include?(num) }
    min_value = interval_elements.min
    interval_elements.count { |num| num == min_value }
end

def find_elements_in_segment(arr, a, b)
    arr.select { |num| (a..b).include?(num) }
end

def sorted_by_sign(arr)
    arr.partition(&:positive?).flatten
end

def count_elements_as_sum(arr)
    arr.count do |element|
      arr.combination(2).any? { |x, y| x + y == element }
    end
end