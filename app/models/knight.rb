class Knight < Piece
  
  def valid_move?(end_x, end_y)
    y_diff = (position_y - end_y).abs
    x_diff = (position_x - end_x).abs
    obstruction_color = determine_piece_color(end_x, end_y)
    
    return false if self.color == obstruction_color
    (x_diff) == 2 && (y_diff == 1) ? true : false
    (y_diff) == 2 && (x_diff == 1) ? true : false
    
  end
  
  def determine_piece_color(x, y)
    if !present?(x, y)
      game.pieces.find_by(position_x: x, position_y: y).color
    end
  end
  
end
