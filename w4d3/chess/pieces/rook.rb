require_relative 'piece' 
require_relative 'slideable' 

class Rook < Piece 
    include Slideable
    
    def get_moves  
        horizontal_and_vertical_dirs
    end

    def symbol
        '♜'.colorize(@color)
    end 
end