class Queen < Piece
	def valid_move?(x, y)
		if 
			(position_x == x || position_y == y) || ((position_x - x).abs == (position_y - y).abs)
			return true
		else
			return false	
		end
	end
end
