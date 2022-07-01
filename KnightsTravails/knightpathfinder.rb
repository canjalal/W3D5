require 'byebug'
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
        @root_node = startingpos
        @considered_positions = [startingpos]
       self.build_move_tree
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
        
    end

end

kpf = KnightPathFinder.new([1,2])
p kpf.new_move_positions([1,2])
p kpf.new_move_positions([1,2])