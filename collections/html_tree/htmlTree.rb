require './tag.rb'
require 'enumerator'
require './iterator_bfs.rb'
require './iterator_dfs.rb'
require './iterator.rb'

class HTMLTree

  include Enumerable

  ALLOWED_TAGS = %w[html head body div h1 h2 p ul li a span].freeze
  ALLOWED_ATTRIBUTES = %w[class id href src alt title style target].freeze

  attr_reader :root

  def initialize(html_string)
    @root = parse_html(html_string)
  end
  
  def bfs
    Iterator_bfs.new(self.root)
  end
  
  def dfs
    Iterator_dfs.new(self.root)
  end

  def each
    iterator = Iterator_dfs.new(self.root)
    iterator.each do |element| 
      yield element
    end
  end

  private

  def parse_html(html_string)
    tokens = html_string.gsub(/\s+/, ' ').scan(/<\/?[^>]+>|[^<>]+/)
    current_node = nil
    stack = []
  
    tokens.each do |token|
      if closing_tag?(token)
        stack.pop
        current_node = stack.last
      elsif opening_tag?(token)
        current_node = handle_opening_tag(token, current_node, stack)
      elsif content?(token, current_node)
        add_content_to_node(current_node, token)
      end
    end
  
    @root
  end

  def closing_tag?(token)
    token =~ /<\/(\w+)>/
  end
  
  def opening_tag?(token)
    token =~ /<(\w+)([^>]*)>/
  end
  
  def handle_opening_tag(token, current_node, stack)
    tag_name, attributes_string = token.match(/<(\w+)([^>]*)>/).captures
    return current_node unless ALLOWED_TAGS.include?(tag_name)
  
    attributes = parse_attributes(attributes_string)
    tag = Tag.new(name: tag_name, attributes: attributes)
    add_node_to_tree(tag, current_node, stack)
    stack.last
  end
  
  def add_node_to_tree(tag, current_node, stack)
    if current_node
      current_node.add_child(tag)
    else
      @root = tag
    end
    stack.push(tag)
  end
  
  def content?(token, current_node)
    current_node && token.strip != ""
  end
  
  def add_content_to_node(current_node, content)
    current_node.content += content.strip
  end

  def parse_attributes(attributes_string)
    attributes = {}
    attributes_string.scan(/(\w+)="([^"]+)"/).each do |key, value|
      attributes[key] = value if ALLOWED_ATTRIBUTES.include?(key)
    end
    attributes
  end
end