
# my_min

def my_min(list) # O(n^2)
  list.each.with_index do |ele, i1|
    smallest = true
    list.each.with_index do |ele2, i2|
      next if i1 == i2
      smallest = false if ele2 < ele
    end
    return ele if smallest
  end
end

def my_min_2(list) # O(n)
    smallest = 0
    list.each {|ele| smallest = ele if ele < smallest}
    smallest
end


# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_2(list)  # =>  -5



# iterate thru array, nested each from first loop index thru last, shovel array into new array
# find max sum of returned array

def largest_contiguous_subsum(list) # O(n^3)
  new_array = []

  list.each_index do |i|
    (i...list.length).each do |j|
      new_array << list[i..j]
    end
  end

  new_array.map { |sub_arr| sub_arr.sum }.max
end

def largest_contiguous_subsum_2(list) # O(n)
    largest_sum = list.first
    curr_sum = 0
    list.each_with_index do |ele, i|
        curr_sum += list[i]
        largest_sum = curr_sum if curr_sum > largest_sum
        curr_sum = 0 if curr_sum < 0
    end
    largest_sum
end

list = [-5, -3, -7]
p largest_contiguous_subsum_2(list) # => 8

list2 = [16,-18,-1,3,10,-7,2]
p largest_contiguous_subsum_2(list2) # => 18

p largest_contiguous_subsum(list2) # => 18

    # # possible sub-sums
    # [5]           # => 5
    # [5, 3]        # => 8 --> we want this one
    # [5, 3, -7]    # => 1
    # [3]           # => 3
    # [3, -7]       # => -4
    # [-7]          # => -7