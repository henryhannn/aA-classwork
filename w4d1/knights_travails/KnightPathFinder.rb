require_relative './PolyTreeNode.rb'

class KnightPathFinder
    attr_reader :root_node, :considered_pos

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_pos = [start_pos]
        self.build_move_tree
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

    def find_path(end_pos)
        target_node = root_node.bfs(end_pos)
        trace_path_back(target_node)
    end

    def trace_path_back(target_node)
        path = []
        curr_node = target_node
        until curr_node.nil?
            path.unshift(curr_node.value)
            curr_node = curr_node.parent
        end
        path
    end
end