
def bad_two_sum?(array, target) # O(n^2)
    array.each_index do |i|
        (i+1...array.length).each do |j|
            return true if array[i] + array[j] == target
        end
    end
    false
end

def okay_two_sum?(array, target) # O(n)
  array = array.sort

  i = 0
  j = array.length - 1

  while i < j
    case array[i] + array[j] <=> target
    when -1
      i += 1
    when 1
      j -= 1
    when 0
      return true
    end
  end

  return false
end

def two_sum?(array, target)


end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false