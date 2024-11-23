
class IteratorBinaryTree
  include Enumerable

  def initialize(root)
    @root = root
  end

  def each(&block)
    process_in_order(@root, &block)
  end

  private

  def process_in_order(node, &block)
    return if node.nil?

    process_in_order(node.left, &block)
    block.call(node)
    process_in_order(node.right, &block)
  end
end
