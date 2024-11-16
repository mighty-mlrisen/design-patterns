require './iterator.rb'

class Iterator_bfs < Iterator
  
  def enumerator
    Enumerator.new do |yielder|
      queue = [self.root]
      until queue.empty?
        element = queue.shift
        yielder << element
        queue.concat(element.children) if element.children
      end
    end
  end
end
