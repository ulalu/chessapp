class Queen < Piece
	def valid_move(new_x, new_y)
		if 
			(position_x == new_x || position_y == new_y) || ((position_x - new_x).abs == (position_y - new_y).abs)
				return true
		else
				return false	
	end
end
