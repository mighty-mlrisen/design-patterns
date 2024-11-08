require 'minitest/autorun'
require './arrayProcessor.rb'

class TestArrayProcessor < Minitest::Test

    def setup
      self.test_array = ArrayProcessor.new([10, -2, 33, 23, -50,12,87,-3,99,123])
    end

    def test_filter_map_even_elements_multiplied
      result = self.test_array.filter_map { |x| x.even? ? x * 2 : nil }
      expected = [20, -4,-100,24]
      assert_equal(expected, result)
    end

    def test_filter_map_positive_elements_multiplied
      result = self.test_array.filter_map { |x| x > 20 ? x * 10 : nil }
      expected = [330, 230, 870, 990, 1230]
      assert_equal(expected, result)
    end

    def test_min_with_block
      result = self.test_array.min { |x| x }
      expected = -50
      assert_equal(expected, result)
    end

    def test_min_abs_values
      result = self.test_array.min { |x| x.abs }
      expected = -2
      assert_equal(expected, result)
    end

    def test_take_while_positive_numbers
      result = self.test_array.take_while { |x| x > 0 }
      expected = [10]
      assert_equal(expected, result)
    end

    def test_take_while_less_than_100
      result = self.test_array.take_while { |x| x < 100 }
      expected = [10, -2, 33, 23, -50, 12, 87, -3, 99]
      assert_equal(expected, result)
    end

    def test_partition_even_odd
      result = self.test_array.partition { |x| x.even? }
      expected = [[10, -2, -50, 12], [33, 23, 87, -3, 99, 123]]
      assert_equal(expected, result)
    end

    def test_partition_positive_negative
      result = self.test_array.partition { |x| x > 0 }
      expected = [[10, 33, 23, 12, 87, 99, 123], [-2, -50, -3]]
      assert_equal(expected, result)
    end

    def test_group_by_odd_even
      result = self.test_array.group_by { |x| x.even? ? :even : :odd }
      expected = { even: [10, -2, -50, 12], odd: [33, 23, 87, -3, 99, 123] }
      assert_equal(expected, result)
    end

    def test_group_by_sign
      result = self.test_array.group_by { |x| x.positive? ? :positive : :negative }
      expected = { positive: [10, 33, 23, 12, 87, 99, 123], negative: [-2, -50, -3] }
      assert_equal(expected, result)
    end

    def test_count_positive_elements
      result = self.test_array.count { |x| x > 0 }
      expected = 7
      assert_equal(expected, result)
    end

    def test_count_elements_less_than_zero
      result = self.test_array.count { |x| x < 0 }
      expected = 3
      assert_equal(expected, result) 
    end
    
    private
    attr_accessor :test_array
end

