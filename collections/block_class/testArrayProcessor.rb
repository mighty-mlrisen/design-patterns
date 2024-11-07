class TestArrayProcessor < Minitest::Test
    def setup
      self.test_array = ArrayProcessor.new([10, -2, 33, 23, -50,12,88,-3,99,123])
    end

    private
    attr_accessor :test_array
end