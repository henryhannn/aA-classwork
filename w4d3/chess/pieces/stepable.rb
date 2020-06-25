require_relative '../board'

module Stepable
    KNIGHT_DIRS = [[-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1]].freeze
    KING_DIRS = [[0, -1], [0, 1], [1, 0], [-1, 0], [1, 1], [-1, -1], [1, -1], [-1, 1]].freeze

    def knight_dirs
        moves(KNIGHT_DIRS)
    end

    def king_dirs
        moves(KING_DIRS)
    end
    
    def moves(dirs)
        moves = []
        i = 0
        while i < 8
            curr_pos = self.pos
            start_pos = self.pos
            start_pos = [start_pos[0] + dirs[i][0], start_pos[1] + dirs[i][1]]
            if self.board.valid_pos?(start_pos) || ((self.board[start_pos].is_a?(Piece)) && (!self.board.valid_pos?(start_pos)) && (self.board[start_pos].color != self.board[curr_pos].color))
                moves << start_pos 
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