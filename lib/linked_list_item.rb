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
end
