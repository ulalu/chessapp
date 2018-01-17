class Knight < Piece
  
  def valid_move?(x, y)
    y_diff = (position_y - y).abs
    x_diff = (position_x - x).abs
    
    
    return false if is_same_color?(x, y)
    (x_diff) == 2 && (y_diff == 1) ? true : false
    (y_diff) == 2 && (x_diff == 1) ? true : false
    
  end
  
  
  
end
