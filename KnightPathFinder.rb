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
        output = []

        valid_moves.each do |move|
            output << move
            @considered_pos << move
        end
        output
    end

    def build_tree
        queue = []
        queue << @root_node
        current = []

        until queue.empty?
            current = queue.shift
            new_move_positions(current.value).each do |pos|
                new_node = PolyTreeNode.new(pos)
                current.add_child(new_node)
                queue << new_node
            end
        end
    end

    def find_path(end_pos)
        node = @root_node.bfs(end_pos)

        return trace_path_back(node)
    end

    def trace_path_back(node)
        output = [node.value]
        current = node
        while current.parent != nil
            output << current.parent.value
            current = current.parent
        end
        output.reverse
    end




    
end


# p KnightPathFinder.valid_index([-1,6])



my_knight = KnightPathFinder.new([0,0])

# my_knight.considered_pos << [4, 2]

# p KnightPathFinder.valid_moves([2, 1], my_knight.considered_pos)

my_knight.build_tree

p my_knight.find_path([6, 6])

# p my_knight.root_node

# p my_knight.new_move_positions([0, 0])

# my_knight.new_move_positions([3, 3])


