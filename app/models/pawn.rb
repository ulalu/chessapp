class Pawn < Piece
  
  # Determines if pawn is making a valid
  def valid_move?(end_x, end_y)
    return false if obstructed?(end_x, end_y)
    y_diff = end_y - position_y if white?
    y_diff = position_y - end_y if black?
    
    forward_move?(end_y, y_diff) ? true : false
  end
    
  # Checks provided coordinates to see if they are valid
  def forward_move?(end_y, y_diff)
    ((y_diff).eql?(2) && first_move? || (y_diff).eql?(1))
  end
  
  # Determines if it's the pawn first move
  def first_move?
    ((position_y).eql?(1) && white? || (position_y).eql?(6) && black?)
  end
  
end
