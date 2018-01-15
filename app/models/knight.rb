class Knight < Piece
  
  def valid_move?(x, y)
    return false unless super.off_the_board?
    return false unless super.not_moved_to_different_space?
    return false unless super.in_check?
    return false unless super.is_my_turn?
    y_diff = (position_y - y).abs
    x_diff = (position_x - x).abs
    obstruction_color = determine_piece_color(x, y)
    
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
