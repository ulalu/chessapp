class Knight < Piece
  def valid_move?(end_x, end_y)
    y_diff = (position_y - end_y).abs
    x_diff = (position_x - end_x).abs
    
    (x_diff) == 2 && (y_diff == 1) ? true : false
    (y_diff) == 2 && (x_diff == 1) ? true : false
  end
end
