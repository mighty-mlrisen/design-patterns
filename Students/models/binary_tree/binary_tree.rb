require './models//binary_tree/iterator_binary_tree.rb'
require './models//binary_tree/node.rb'
require './models/entities/student.rb'

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

    def print_tree(node = self.root)
      return if node.nil?
      print_tree(node.left)
      puts (node.element)
      print_tree(node.right)
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