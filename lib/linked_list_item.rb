class LinkedListItem
  include Comparable

  attr_reader :payload
  def initialize(data)
    @payload = data
  end

  attr_reader :next_item
  def next_item=(value)
    if value === self
      raise ArgumentError
    else
      @next_item = value
    end
  end

  def last?
    if @next_item != nil
      false
    else
      true
    end
  end

  def <=>(other)
    if self.payload.is_a?(Symbol) && other.payload.is_a?(String)
      1
    elsif self.payload.is_a?(String) && other.payload.is_a?(Symbol)
      -1
    elsif self.payload.is_a?(Fixnum) && other.payload.is_a?(Symbol)
      -1
    elsif self.payload.is_a?(Symbol) && other.payload.is_a?(Fixnum)
      1
    elsif self.payload.is_a?(Fixnum) && other.payload.is_a?(String)
      -1
    elsif self.payload.is_a?(String) && other.payload.is_a?(Fixnum)
      1
    else
      self.payload <=> other.payload
    end
  end

  def ===(other)
    self.equal?(other)
  end


end
