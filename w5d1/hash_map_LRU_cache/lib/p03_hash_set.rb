class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      self[key] << key
      @count += 1
      resize! if @count == num_buckets
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key) 
      @count -= 1
      #resize! if @count == num_buckets / 2
    end
  end

  private

  def [](num)
    idx = num.hash % num_buckets
    @store[idx]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_num_buckets = num_buckets * 2
    new_store = Array.new(new_num_buckets) { Array.new }
    @store.flatten.each { |ele| new_store[ele % new_num_buckets] << ele }
    @store = new_store
  end
end
