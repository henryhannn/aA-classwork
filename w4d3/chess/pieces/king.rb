require_relative 'piece'
require_relative 'stepable'

class King < Piece
    include Stepable

    def get_moves
        king_dirs
    end

    def symbol
        '♚'.colorize(color)
    end
end