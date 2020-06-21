require 'byebug'

class PolyTreeNode

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def inspect
        "<value: #{@value}, parent: #{@parent.inspect}, children: #{@children.map(&:inspect)}"
    end
    
    def parent=(node)
        if parent != nil
            parent.children.delete(self)
        end
        @parent = node
        node.children << self if node != nil
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        raise "Child not found" if !@children.include?(child)
        child.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        self.children.each do |child|
            result = child.dfs(target_value)
            return result if result != nil
        end
        nil
    end

    def bfs(target_value)
        queue = []
        queue.unshift(self)
        until queue.empty?
            curr_node = queue.pop
            return curr_node if curr_node.value == target_value
            curr_node.children.each do |child|
                queue.unshift(child)
            end
        end
        nil
    end

    attr_reader :value, :parent, :children
end