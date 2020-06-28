def first_anagram?(word1, word2) # O(n!)
    word1_arr = word1.split("")
    perm_arr = permutations(word1_arr)
    words_arr = perm_arr.map {|ele| ele.join("")}
    p words_arr
    words_arr.include?(word2)
end

def permutations(anagram) #gizmo
    return [anagram] if anagram.length == 1
    new_arr = []
    letter = anagram.shift #g
    words = permutations(anagram) #izmo [izmo, zimo, zmio, zmoi]

    words.each do |word|
      word.each_index do |i| # gizmo, igzmo, izgmo, izmgo, izmog
          new_arr << word[0...i] + [letter] + word[i..-1]
      end
    end
    new_arr
end

# [1, 2, 3]
# [1, 3, 2], [2, 1, 3], ....
# [1]  permu[2, 3]
# [1] [[2,3], [3,2]]
# [[1, 2, 3], [2, 3, 1], [2, 1, 3], [1, 3, 2], [3, 2, 1], [3, 1, 2]]

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true


def second_anagram?(word1, word2) # O(n^3)

  check_word = word2.split('')
  word1.each_char do |char|
    if check_word.include?(char)
      check_word.delete_at(check_word.index(char))
    end
  end

  check_word.empty?
end


# p second_anagram?("gizmogizmo", "sallysally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true


def third_anagram?(word1, word2) # O(nlogn)
    word1.split("").sort == word2.split("").sort #Ruby sort has O(log n)
end

# p third_anagram?("gizmogizmo", "sallysally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(word1, word2) # O(n)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  word1.each_char { |char| hash1[char] += 1 } 
  word2.each_char { |char| hash2[char] += 1 }

  hash1 == hash2
end

p fourth_anagram?("gizmogizmo", "sallysally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true