class Bishop < Piece

	def valid_move?(x,y)
	  super && ((position_x - x).abs == (position_y - y).abs) 
	end
end

