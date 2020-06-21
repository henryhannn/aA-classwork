# Warmup
# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.

#recursive
def range(min, max)
    return [] if max < min 
    return [min] if max - 1 == min 
    range(min, max - 1) + [max - 1]
end

# def range(min, max)
#     return [] if max <= min 

#     range(min, max - 1) << max - 1
# end
#iterative

# def range(min, max)
#     # return [] if max < min 
#     array = []
#     (min...max).each {|num| array << num}
#     array
# end

# p range(1, 5)

# 1. Exponentiation
# Write two versions of exponent that use two different recursions:

# this is math, not Ruby methods.

# recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

def exp(num, pow)
    return 1 if pow == 0
    num * exp(num, pow - 1)
end

# p exp(2, 0)

# recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

def exp(num, pow)
    return 1 if pow == 0
    exp2 = exp(num, pow / 2)
    exp3 = exp(num, (pow - 1) / 2)
    if pow % 2 == 0
        exp2 * exp2
    else
        exp3 * exp3 * num
    end
end

# p exp(2,2)

# 2. Deep dup
# The #dup method doesn't make a deep copy:

class Array 
    def deep_dup
        newarr = []
        self.each do |sub|
            if !sub.is_a?(Array)
                newarr << sub 
            else
                newarr << sub.deep_dup 
            end
        end
        newarr
    end
end
# x = [1, [2], [3, [4]]]
# p x.object_id
# p x.deep_dup
# p x.deep_dup.object_id


# 3. Fibonacci
# Write a recursive and an iterative Fibonacci method. 
# The method should take in an integer n and return the first n Fibonacci numbers in an array.

# recursive

def fibs(n)
    return [] if n == 0
    return [0] if n == 1

    return [0, 1] if n == 2 #[1]

    num = fibs(n - 1)
    num << num[-2] + num[-1]

    #fibs(3) = 0 + 1
    #fibs(3) = fibs(1) + fibs(2)
    #fibs(3) = fibs(n - 2) + fibs(n - 1)
end

# iterative

# def fibs(n)
#     return [] if n == 0
#     return [0] if n == 1
#     count = 0
#     array = [0, 1]
#     while count < n - 2
#         array << array[-2] + array[-1]
#         count += 1
#     end
#     array
# end

# p fibs(4)

# 4. Binary Search

def bsearch(array, target)
    middle_idx = array.length / 2 
    return middle_idx if array[middle_idx] == target
    return nil if array[middle_idx] != target && array.length == 1

    if array[middle_idx] > target 
        bsearch(array[0...middle_idx], target)
    else
        result = bsearch(array[middle_idx + 1.. -1], target)
        return nil if result == nil
        result + middle_idx + 1
    end
end


# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# 5. Merge Sort
# Implement a method merge_sort that sorts an Array:

# The base cases are for arrays of length zero or one. Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, watch this gif and check out this diagram.

class Array
    def merge_sort
        middle_idx = self.length / 2
        return [] if self.length == 0
        
        return self if self.length == 1

        left = self[0...middle_idx]
        right = self[middle_idx..-1]

        left_merge = left.merge_sort
        right_merge = right.merge_sort

        merge(left_merge, right_merge)
    end
#x = [6, 4, 1, 2, 8, 3, 7, 5]
    def merge(left, right)
        arr = []

        while left.length > 0 && right.length > 0
            if left.first < right.first
                arr << left.shift
            else
                arr << right.shift
            end
        end

        arr + left + right
    end
end


# x = [6, 4, 1, 2, 8, 3, 7, 5]
# p x.merge_sort

# 6. Array Subsets
# Write a method subsets that will return all subsets of an array.

def subsets(arr)
    return [[]] if arr.empty?
    return [arr] if arr.length == 1

    newarr = [[]]
    subsets(arr[0...-1]) + subsets(arr.last) + arr
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]