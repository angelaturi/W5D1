require 'byebug'

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def inspect
    "<LinkedList: #{self.to_s}, next:#{@next}, prev:#{@prev}>"
  end

  def remove
    if self.prev
      self.prev.next = @next
    end 
  
    if self.next
      self.next.prev = @prev
    end 
    
    self.next = nil
    self.prev = nil

    self
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    head.next = tail
    tail.prev = head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    empty? ? nil : head.next
  end

  def last
    empty? ? nil : tail.prev
  end

  def empty?
    head.next == tail    
  end

  def get(key)
    each { |node| return node.val if node.key == key }
    nil
  end

  def include?(key)
    one? { |node| node.key == key }
  end

  def append(key, val)
    node = Node.new(key, val)

    tail.prev.next = node
    node.prev = tail.prev
    
    node.next = tail
    tail.prev = node
    node
  end

  def update(key, val)
    each do |node|
      node.val = val if node.key == key
      return node
    end
  end

  def remove(key)
    each do |node| 
      if node.key == key
        node.remove 
        return node.val
      end 
    end 
    nil
  end

  def each
    node = head.next
    while node != tail do
      yield node
      node = node.next
    end
  end

  private

  attr_reader :tail, :head

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
