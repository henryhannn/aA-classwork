class Game
  
  attr_accessor :end_arr, :mid_arr, :start_arr

  def initialize
    @end_arr = []
    @mid_arr = []
    @start_arr = [1,2,3,4]
  end

  def move
    while !win?
      render
        print "Put in an array to move your block from and to (between 1 and 3) "
        input = gets.chomp.split.map(&:to_i)
        chosen_arr = input.first
        target_arr = input.last
        case chosen_arr
          when 1
            value = end_arr.first
          when 2
            value = mid_arr.first
          when 3
            value = start_arr.first
          else
            puts "Try again"
        end

        case target_arr
          when 1
            if value < end_arr.first
              end_arr.unshift(value) 
            end
          when 2
            mid_arr.unshift(value) if value < mid_arr.first
          when 3
            start_arr.unshift(value) if value < start_arr.first
          else
          puts "Try again"
        end
    end
  end

  def render
    p end_arr
    p mid_arr
    p start_arr
  end

  def win?
    return true if end_arr.sort && (mid_arr.empty? && start_arr.empty?)
    false
  end
  
end

x = Game.new(4)