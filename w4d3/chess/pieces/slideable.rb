require_relative '../board'

module Slideable
    HORIZONTAL_AND_VERTICAL_DIRS = [[0, -1], [0, 1], [1, 0], [-1, 0]].freeze
    DIAGONAL_DIRS = [[1, 1], [-1, -1], [1, -1], [-1, 1]].freeze

    def horizontal_and_vertical_dirs
        moves(HORIZONTAL_AND_VERTICAL_DIRS)
    end

    def diagonal_dirs
        moves(DIAGONAL_DIRS)
    end

    def moves(dirs)
        moves = []
        i = 0
        while i < 4
            curr_pos = self.pos.dup
            start_pos = self.pos
            p start_pos 
            loop do
                start_pos = [start_pos[0] + dirs[i][0], start_pos[1] + dirs[i][1]]
                if self.board.valid_pos?(start_pos) || ((self.board[start_pos].is_a?(Piece)) && (!self.board.valid_pos?(start_pos)) && (self.board[start_pos].color != self.board[curr_pos].color))
                    moves << start_pos 
                end
                break if !@board.valid_pos?(start_pos)
            end
        i += 1
        end
        moves
    end

    def move_dirs
        # subclass implements this
        raise NotImplementedError
    end
end

