class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(new_parent)
        
        if @parent != nil
            @parent.children.select! { |child| child != self }
        end

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

end


