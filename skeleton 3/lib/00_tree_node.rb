class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(new_parent)
        @parent = new_parent
        if new_parent != nil
            unless parent.children.include?(self)
                parent.children << self
            end
        end
    end
end


