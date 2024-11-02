def count_matching_elements(arr1, arr2)
    arr1.count { |element| arr2.include?(element) }
end

def count_min_in_interval(array, a, b)
    interval_elements = array.select { |num| (a..b).include?(num) }
    min_value = interval_elements.min
    interval_elements.count { |num| num == min_value }
end
