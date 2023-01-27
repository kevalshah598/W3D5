require_relative "polytree"

class KnightPathFinder
    attr_accessor :root_node, :considered_pos

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_pos = [start_pos]
    end
    
    def self.valid_moves(pos, previous_positions)
        x, y = pos
        output = [[x + 2, y + 1], [x + 2, y - 1], [x - 2, y + 1], [x - 2, y - 1], [x + 1, y + 2], [x - 1, y + 2], [x + 1, y - 2], [x - 1, y - 2]]
        
        output.select { |pos| self.valid_index(pos) && !previous_positions.include?(pos) }
    end

    def self.valid_index(pos)
        x, y = pos
        return false if x < 0 || x > 7 || y < 0 || y > 7
        return true
    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos, self.considered_pos)
        valid_moves.each do |move|
            @root_node.add_child(PolyTreeNode.new(pos))
            @considered_pos << move
        end
        p @considered_pos
    end

    
end


# p KnightPathFinder.valid_index([-1,6])



my_knight = KnightPathFinder.new([0,0])

p my_knight.considered_pos << [0, 2]

p KnightPathFinder.valid_moves([2, 1], my_knight.considered_pos)

# my_knight.new_move_positions([3, 3])


