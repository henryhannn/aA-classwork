
class Array

    def my_uniq
        raise ArgumentError if self.empty?
        count = Hash.new(0)
        self.each {|ele| count[ele] += 1}
        count.keys
    end

    def two_sum
        raise ArgumentError if self.length < 2
        pairs = []
        (0...self.length).each do |start_index|
            (start_index + 1...self.length).each do |index|
                pairs << [start_index, index] if (self[start_index] + self[index]) == 0
            end
        end
        pairs
    end

    def my_transpose
      self.each_with_index.map do |ele, index|
        self.map { |row| row[index] }
      end
    end


    def stock_picker
      pair = []
      tracker = 0

      self.each_with_index do |ele, i|
        j = i + 1
        while j < self.length
          if self[j] - self[i] > tracker
            tracker = self[j] - self[i]
            pair = [i, j]
          end
          j += 1
        end
      end

      pair
    end

end  
