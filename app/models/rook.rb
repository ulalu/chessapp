class Rook < Piece

	def valid_move?(x, y)
		if 
			((position_x == x) || (position_y == y))
			return true
		else
	  		return false
		end
	end
end
