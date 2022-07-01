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
        return self if self.value == target_value
        @children.each do |child|
            searchresult = child.dfs(target_value)
            return searchresult unless searchresult.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = []
        queue << self
        while(queue.length > 0)
            node = queue.shift
            return node if node.value == target_value
            queue.concat(node.children)
        end
        nil
    end

end