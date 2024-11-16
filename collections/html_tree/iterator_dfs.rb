require './iterator.rb'

class Iterator_dfs < Iterator
  
  def enumerator
    Enumerator.new do |yielder|
      stack = [self.root]
      until stack.empty?
        element = stack.pop
        yielder << element
        stack.concat(element.children.reverse) if element.children
      end
    end
  end
end