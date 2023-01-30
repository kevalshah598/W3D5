class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(new_parent)
        # Take off parent for self if self has a parent
        if @parent != nil
            @parent.children.select! { |child| child != self }
        end

        # Assign new parent to self & add self to parent's children array
        @parent = new_parent
        if new_parent != nil
            unless parent.children.include?(self)
                parent.children << self
            end
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        unless @children.include?(child_node)
            raise 'Not your kid.'
        end
        child_node.parent = nil
    end

    def dfs(target_value)
        if @value == target_value
            return self 
        end
        @children.each do |child|
            match = child.dfs(target_value)
            if match != nil
                return match
            end
        end
        nil
    end

    def bfs(target_value)
        queue = []
        queue << self
        until queue.empty?
            current = queue.shift
            return current if current.value == target_value
            # queue += current.children
            current.children.each do |child|
                queue << child
            end
        end
        nil
    end
end