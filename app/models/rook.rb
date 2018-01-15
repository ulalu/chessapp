class Rook < Piece

	def valid_move?(x, y)
		return false unless super.valid_move?
		if 
			((position_x == x) || (position_y == y)) && generic_validity(x,y)
			return true
		else
	  		return false
		end
	end
	
end
