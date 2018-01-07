class Rook < Piece

	def valid_move(new_x, new_y)
		if 
			((position_x == new_x) || (position_y == new_y))
			return true
	  else
	  	return false
	  end
	end
 end
