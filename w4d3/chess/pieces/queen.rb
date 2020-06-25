require_relative "piece" 
require_relative "slideable" 

class Queen < Piece 
    include Slideable

    def get_moves  
        horizontal_and_vertical_dirs + diagonal_dirs
    end

    def symbol
        '♛'.colorize(color)
    end 
end