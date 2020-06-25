require_relative 'piece'

class Pawn < Piece
    TOP_DIRS = [[1, 0], [1, 1], [1, -1], [2, 0]].freeze
    BOTTOM_DIRS = [[-1, 0], [-1, 1], [-1, -1], [-2, 0]].freeze

    def pawn_dirs
        moves
    end
    
    def moves
        moves = []
        curr_pos = self.pos
        start_pos = self.pos
        dirs =  nil 
        if self.color == "white" 
            dirs = TOP_DIRS 
        else  
            dirs = BOTTOM_DIRS  
        end 
        
        forward = [forward[0] + dirs[0][0], forward[1] + dirs[0][1]]
        if valid_pos?(start_pos)
            moves << start_pos 
        end

        i = 1
        while i < 3
            attack = [start_pos[0] + dirs[i][0], start_pos[1] + dirs[i][1]]
            if !@board[attack].empty? && @board[attack].color != @board[curr_pos].color
                moves << start_pos
            end
        end

        if self.at_start_row?  
            moves << [start_pos[0] + dirs[3][0], start_pos[1] + dirs[3][1]]
        end
        moves
    end

    def at_start_row? 
        (self.color == "white" && self.pos[0] == 1) || (self.color == "black" && self.pos[0] == 6)
    end 
end