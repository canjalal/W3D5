require 'byebug'
require_relative "polytreenode.rb"
require_relative "node.rb"
require_relative "stackandqueue.rb"
class KnightPathFinder

    ALLMOVES = [
        [1, 2],
        [1, -2],
        [-1, 2],
        [-1, -2],
        [2, 1],
        [2, -1],
        [-2, 1],
        [-2, -1]]

    def initialize(startingpos)
        @root_node = PolyTreeNode.new(startingpos)
        @considered_positions = [startingpos]
        self.build_move_tree
        return true
    end

    def self.valid_moves(pos)
        possiblemoves = ALLMOVES.map {|move| [pos[0] + move[0], pos[1] + move[1]]}
        validmoves = possiblemoves.select {|move| KnightPathFinder.is_valid_pos?(move)}
        validmoves
    end

    def self.is_valid_pos?(pos)
        x, y = pos
        x.between?(0, 7) && y.between?(0, 7)
    end

    def new_move_positions(pos)
       
        valid_moves = KnightPathFinder.valid_moves(pos) 
        real_valid_moves = valid_moves.reject {|move| @considered_positions.include?(move)}
        @considered_positions.concat(real_valid_moves)
        real_valid_moves
    end

    def build_move_tree
        queue = MyQueue.new
        queue.enqueue(@root_node) 
        while(queue.size > 0)
            node = queue.dequeue
            childpositions = self.new_move_positions(node.value)
            nodechildren = childpositions.map {|pos| PolyTreeNode.new(pos)}
            nodechildren.each do |child|
                node.add_child(child)
            end

            nodechildren.each {|child| queue.enqueue(child)}
            # queue.concat(nodechildren)
        end

        return true
        # return @root_node
        
    end

    def printbfs
        queue = MyQueue.new
        queue.enqueue(@root_node)
        while(queue.size > 0)
            node = queue.dequeue
            p node.value
            node.children.each {|child| queue.enqueue(child)}
        end
        nil
    end

    def bfs(pos)
        queue = MyQueue.new
        queue.enqueue(@root_node)
        while(queue.size > 0)
            node = queue.dequeue
            return node if node.value == pos
            node.children.each {|child| queue.enqueue(child)}
        end
        nil
    end

    def tracepathback(endnode)
        nodepath = MyStack.new
        currnode = endnode
        until(currnode.nil?)
            nodepath.push(currnode)
            currnode = currnode.parent
        end
        patharray = []
        puts "Path from #{@root_node.value} to #{endnode.value}:"
        while(nodepath.size > 0)
            patharray << nodepath.pop.value
            p patharray[-1]
        end
        patharray
    end

    def findpath(pos)
        endnode = bfs(pos)
        if(!endnode.nil?)
            tracepathback(endnode)
        end
    end

    def inspect # what .new returns, also used by p
        self.root_node.value
    end
private
attr_accessor :considered_positions
end

# kpf = KnightPathFinder.new([1,2])
# kpf.printbfs