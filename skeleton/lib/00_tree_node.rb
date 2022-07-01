class PolyTreeNode
    attr_accessor :value, :children, :parent

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(par)
        if !@parent.nil?
            @parent.children.delete(self)
        end
        @parent = par
        unless @parent.nil?
            @parent.children << self 
        end
        nil
    end

    def add_child(child_node)
        # @children << child_node
        child_node.parent = self
    end

    def remove_child(child_node)
        if @children.include?(child_node)
            child_node.parent = nil
        else
            raise ArgumentError.new("this is not my kid")
        end 
    end

    def dfs(target_value)
        return self.value if self.value == target_value
        @children.each do |child|
            return child.dfs(target_value)
        end
        nil 
    end
end