class Knight < Piece
  def valid_move?(end_x, end_y)
    y_diff = (position_y - end_y).abs
    x_diff = (position_x - end_x).abs
    debugger
    (x_diff == 1 || 2 && y_diff == 1 || 2) ? true : false
  end
  
end
