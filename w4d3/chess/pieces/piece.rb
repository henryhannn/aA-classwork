
class Piece
    attr_reader :color, :board
    attr_accessor :pos
#check if module has access to instance variables without getter 
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
        @board.add_piece(self, pos)
    end  

    def empty?
        false
    end

    def symbol
        # subclass implements this with unicode chess char
        raise NotImplementedError
    end
end 