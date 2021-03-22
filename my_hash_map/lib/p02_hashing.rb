class Integer
  # Integer#hash already implemented for you
end

class String
  def hash
    self.chars.inject(0) { |a, b| a.ord.hash ^ b.ord.hash }
  end
end

class Array
  def hash
    # sum = ""
    # self.each do |ele|
    #   sum += ele.to_s(2) 
    # end

    # sum.to_i

    self.inject(0) { |a, b| a.hash ^ b.hash }
    
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.inject(0) { |a, b| a.hash ^ b.hash }
    # to_a.sort_by(&:hash).hash
  end
end
