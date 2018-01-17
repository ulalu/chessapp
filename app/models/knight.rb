class Knight < Piece
  
  def valid_move?(x, y)

    return false unless super.off_the_board?
    return false unless super.not_moved_to_different_space?
    return false unless super.in_check?
    return false unless super.is_my_turn?
   
    y_diff = (position_y - y).abs
    x_diff = (position_x - x).abs
    
    return false if is_same_color?(x, y)
    (x_diff) == 2 && (y_diff == 1) ? true : false
    (y_diff) == 2 && (x_diff == 1) ? true : false
    
  end
  
  
  
end
