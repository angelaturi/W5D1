class MaxIntSet
  attr_reader :store, :max

  def initialize(max)
    @max = max
    @store = Array.new(max,false)
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false 
  end

  def include?(num)
    store[num]
  end

  private

  def is_valid?(num)
    num <= max && num >= 0
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def include?(num)
    store[num % num_buckets].include?(num)
  end

  def insert(num)
    i = num % num_buckets
    store[i] << num
    num
  end

  def remove(num)
    i = num % num_buckets
    store[i].delete(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
    

  end

  def remove(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
