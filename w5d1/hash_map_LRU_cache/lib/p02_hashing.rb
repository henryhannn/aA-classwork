class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    code = 0
    self.each.with_index do |ele, idx|
      code += ele.hash * (idx+1)
    end
    code 
  end
end

class String
  def hash
    # chars.map do |char|

    # end
    arr = self.bytes
    arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort_by(&:hash).hash
  end
end