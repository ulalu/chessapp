class Pawn < Piece

  def valid_move?(end_x, end_y)
    y_diff = end_y - position_y if white?
    y_diff = position_y - end_y if black?
    
    forward_move?( y_diff) ? true : false
    end
    
    def forward_move?(y_diff)
    return true if ((y_diff).eql?(2) && first_move? || (y_diff).eql?(1))
    end
    
    def first_move?
    ((position_y).eql?(1) && white? || (position_y).eql?(6) && black?)
    end
  end
  
end
