class Tile
    attr_reader :is_flag, :is_bomb, :is_hidden
    def initialize()
        @is_flag = false
        @is_bomb = false
        @is_hidden = true
    end

    def toggle_flag
        @is_flag = !@is_flag
    end

    def toggle_hidden
        @is_hidden = !@is_hidden
    end

    def toggle_bomb
        @is_bomb = !@is_bomb
    end
end