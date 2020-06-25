require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
    include Stepable

    def get_moves
        knight_dirs
    end

    def symbol
        '♞'.colorize(color)
    end
end