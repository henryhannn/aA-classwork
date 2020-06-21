require_relative './PolyTreeNode.rb'

class KnightPathFinder
    attr_reader :root_node, :considered_pos

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_pos = [start_pos]
        @tree = build_move_tree
    end
    
    def self.valid_moves(pos)
        x, y = pos
        moves = [
            [x-2, y+1],
            [x-1, y+2],
            [x+1, y+2],
            [x+2, y+1],
            [x+2, y-1],
            [x+1, y-2],
            [x-1, y-2],
            [x-2, y-1]
        ].reject { |pos| pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7 }
    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        new_moves = valid_moves.reject { |move| @considered_pos.include?(move) }
        @considered_pos += new_moves
        new_moves
    end

    def build_move_tree
        queue = []
        queue.unshift(self.root_node)
        until queue.empty?
            curr_node = queue.pop
            new_moves = new_move_positions(curr_node.value)
            p new_moves
            new_moves.each do |move|
                new_node = PolyTreeNode.new(move)
                curr_node.add_child(new_node)
                queue.unshift(new_node)
            end
        end
    end
end