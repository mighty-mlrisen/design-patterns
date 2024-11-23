class Tag
  attr_accessor :name, :attributes, :content, :children

  def initialize(name: , attributes: {}, children: [], content: '')
    self.name = name
    self.attributes = attributes
    self.content = content
    self.children = children
  end

  def add_child(tag)
    @children << tag
  end

  def to_s
    "<#{self.name}#{has_attributes? ? attributes_string : ''}>#{has_content? ? self.content : ''}</#{self.name}>"
  end
  

  def count_child
    self.children.size
  end

  def has_attributes?
    !self.attributes.empty?
  end

  def attributes_string
    self.attributes.map { |k, v| " #{k}=\"#{v}\"" }.join('')
  end

  def has_content?
    self.content.length > 0
  end
end
