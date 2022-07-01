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
     #   self.build_move_tree
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
end