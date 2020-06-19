require_relative("board.rb")
require_relative("tile.rb")

class Minesweeper

    def initialize
        @board = Board.new
    end

    def play_turn
        p 'Enter position with a space, for example 3 4: '
        pos = gets.chomp.split(" ").map! {|val| val.to_i}
        tile = @board.grid[pos[0]][pos[1]]
        tile.toggle_hidden
        @board.render
        @board.show_all_bombs
        if tile.is_bomb
            p 'Game Over!'
            return true
        end
        if self.only_bombs_left
            p 'You Win!'
            return true
        end
        return false
    end

    def run
        is_over = false
        while !is_over
            is_over = play_turn
        end

    end

    def only_bombs_left
        @board.grid.each do |row|
            row.each do |val|
                if val.is_hidden && !val.is_bomb
                    return false
                end
            end
        end
        return true
    end
end

g = Minesweeper.new()
g.run