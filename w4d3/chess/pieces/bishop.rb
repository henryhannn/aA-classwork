require_relative "piece" 
require_relative "slideable" 

class Bishop < Piece 
    include Slideable

    def get_moves  
        diagonal_dirs
    end

    def symbol
        '♝'.colorize(color)
    end 
end