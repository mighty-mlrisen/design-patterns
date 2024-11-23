class Iterator 
  include Enumerable
  attr_reader :root

  def initialize(root)
    self.root = root
  end

  def each
    enumerator = self.enumerator
    enumerator.each do |element| 
      yield element
    end
  end

  protected
  attr_writer :root
  
  def enumerator
    raise NotImplementedError
  end
end