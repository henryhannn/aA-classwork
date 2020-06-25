require_relative './all_pieces'  
class Board 
    attr_reader :board 
    def initialize
        null_piece = NullPiece.instance 
        @board = Array.new(8) { Array.new(8, null_piece) }

    end  

    def [](pos)
        row, col = pos 
        @board[row][col]
    end

    def []=(pos, target)
        row, col = pos 
        @board[row][col] = target
    end

    def fill_board
        Rook.new("white", self, [0, 0])
        Bishop.new("black", self, [7, 7])
        King.new("white", self, [3, 4])
        Pawn.new("black", self, [1, 0])
    end 
    
    def add_piece(piece, pos)
        raise 'position not empty' unless self[pos].empty?
        self[pos] = piece
    end

    def move_piece(start_pos, end_pos) 
        raise "Invalid Position!" if !valid_pos?(end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.instance 
        self[end_pos].pos = end_pos
    end

    def valid_pos?(end_pos) 
        return false if end_pos[0] < 0 || end_pos[0] > 7 || end_pos[1] < 0 || end_pos[1] > 7 
        return false if !self[end_pos].empty?
        true 
    end



end

