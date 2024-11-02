def count_matching_elements(arr1, arr2)
    arr1.count { |element| arr2.include?(element) }
end
