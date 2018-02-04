class Queen < Piece
	def valid_move?(x, y)
		return false unless super
		if 
			(position_x == x || position_y == y) || ((position_x - x).abs == (position_y - y).abs)
			return true
		else
			return false	
		end
	end
end
