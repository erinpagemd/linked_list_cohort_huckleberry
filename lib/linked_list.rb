require_relative 'linked_list_item'

class LinkedList
  attr_accessor :first_item
  attr_accessor :size
  attr_accessor :last_item

  def initialize(*args)
    if args.empty?
      @first_item = nil
      @size = 0
      @last_item = nil
    else
      @size = 0
      args.each{|arg| push(arg)}
    end
  end

  def push(payload)
    if @first_item.nil?
      lli = LinkedListItem.new(payload)
      # make the LinkedListItem the first_item in the LinkedList
      @first_item = lli
      @last_item = lli
    else
      lli = LinkedListItem.new(payload)
      # make the last_item have a next_item of lli
      @last_item.next_item = lli
      # last item is the lli with a next_item of nil
      @last_item = lli
    end
    # increase the size of the LinkedList
    @size += 1
  end

  def get(num)
    if num < 0
      raise IndexError, "Index cannot be less than zero"
    elsif num === 0
      @first_item.payload
    elsif !(1..@size).cover?(num)
      raise IndexError, "no such item"
    else #num number of times get the next_item
      my_item = @first_item
      num.times do
        my_item = my_item.next_item
      end
      my_item.payload
    end
  end

  def [](num)
    get(num)
  end

  def []=(num, payload)
    #make a new lli with payload
    lli = LinkedListItem.new(payload)
    #make the new lli.next_item at node+1
    after_item = @first_item
    after_count = num + 1
    after_count.times do
      after_item =after_item.next_item
    end
    lli.next_item = after_item
    #replace next_item at node num-1 with the new lli
    before_item = @first_item
    before_count = num - 1
    before_count.times do
      before_item = before_item.next_item
    end
    before_item.next_item = lli

  end

  def last
    if @last_item.nil?
      @last_item
    else
      @last_item.payload
    end
  end

  def to_s
    if @size === 0
      "| |"
    else
      # @size number of times, shovel in each payload
      my_item = @first_item
      string = my_item.payload
      my_num = @size - 1
      my_num.times do
        my_item = my_item.next_item
        string << ", #{my_item.payload}"
      end
      "| #{string} |"
    end
  end

  def delete(index)
    raise IndexError if !(0..@size).include?(index)
    @size -= 1
    if index === 0
      @first_item = @first_item.next_item
    else
      after_count = index + 1
      after_item = @first_item
      after_count.times do
        after_item = after_item.next_item
      end
      before_count = index - 1
      before_item = @first_item
      before_count.times do
        before_item = before_item.next_item
      end
      before_item.next_item = after_item
    end
  end

  def index(str)
    my_item = @first_item
    if @size === 0
      nil
    elsif @first_item.payload.match(str)
      0
    else
      counter = 0
      until my_item.payload.match(str)
        my_item = my_item.next_item
        # if my_item.nil? break out of the loop and return nil
        counter += 1
        if my_item.nil?
          counter = nil
          break
        end
      end
      counter
    end
  end

end
