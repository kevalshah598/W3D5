require_relative "polytree"

class KnightPathFinder
    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_pos = [start_pos]
    end
    
    def self.valid_moves(pos)
        x, y = pos
        output = []
    end

    def self.valid_index(x, y)
        return false if x < 0 || x > 7 || y < 0 || y > 7
        return true
    end
end


p KnightPathFinder.valid_index(4,6)