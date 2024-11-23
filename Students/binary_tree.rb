require './node.rb'
require './iterator_binary_tree.rb'
require './student.rb'

class BinaryTree 
  
    include Enumerable
    attr_accessor :root

    def initialize
      self.root = nil
    end

    def insert(element)
      if self.root.nil?
        self.root = Node.new(element)
      else
        insert_node(self.root, element)
      end
    end

    def iterator 
      IteratorBinaryTree.new(self.root)
    end

    private

    def insert_node(node, element)
      if element < node.element
        if node.left.nil?
          node.left = Node.new(element)
        else
          insert_node(node.left, element)
        end
      else
        if node.right.nil?
          node.right = Node.new(element)
        else
          insert_node(node.right, element)
        end
      end
    end
end