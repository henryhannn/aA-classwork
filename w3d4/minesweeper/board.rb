class Board
    attr_reader :grid
    def initialize()
        @grid = Array.new(9) {Array.new(9, Tile.new())}
        seed_bombs
    end

    def seed_bombs
        @grid.each.with_index do |row, i|
            @grid.each.with_index do |col, j|
                add_bomb = rand(0..9)
                if add_bomb == 0
                    @grid[i][j].toggle_bomb
                end
            end
        end
    end

    def render
        puts "  #{(0..8).to_a.join(" ")}"
        @grid.each.with_index do |row, i|
            str = i.to_s
            row.each.with_index do |val, j|
                str += " " + adjacent_bombs(i, j).to_s
            end
            puts str
        end
    end

    def adjacent_bombs(i, j)
        bombCount = 0
        i -= 1
        j -= 1
        iAdder = 0
        if i < 0 || i + 2 > @grid.length
            iAdder = -1
            i = 0
        end
        jAdder = 0
        if j < 0 || j + 2 > @grid[0].length
            jAdder -= 1
            j = 0
        end
        (i..i+2 + iAdder).each do |rowIn|
            (j..j+2 + jAdder).each do |colIn|
                if @grid[i][j].is_bomb

                    bombCount += 1
                end
            end
        end
        return bombCount
    end

    def show_all_bombs
        temp_grid = @grid.dup
        @grid.each do |row|
            row.each do |val|
                if val.is_hidden
                    val.toggle_hidden
                end
            end
        end
        puts "  #{(0..8).to_a.join(" ")}"
        @grid.each.with_index do |row, i|
            str = i.to_s
            row.each.with_index do |val, j|
                bombThing = 0
                if val.is_bomb
                    bombThing = 1
                end
                str += " " + bombThing.to_s
            end
            puts str
        end
        @grid = temp_grid
    end

end