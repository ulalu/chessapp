class Rook < Piece

	def valid_move?(x, y)
	  super
			((position_x == x) || (position_y == y))
	end
	
end
