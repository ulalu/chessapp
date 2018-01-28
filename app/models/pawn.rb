class Pawn < Piece
  
  # Determines if pawn is making a valid
  def valid_move?(x, y)
    return false unless super.valid_move?
    y_diff = y - position_y if white?
    y_diff = position_y - y if black?
    
    forward_move?(y, y_diff) ? true : false
  end
    
  # Checks provided coordinates to see if they are valid
  def forward_move?(y, y_diff)
    ((y_diff).eql?(2) && first_move? || (y_diff).eql?(1))
  end
  
  # Determines if it's the pawn first move
  def first_move?
    ((position_y).eql?(1) && white? || (position_y).eql?(6) && black?)
  end
  
  def promotable?(x, y)
    (color.eql?('black') && position_y.eql?(0) || color.eql?('white') && position_y.eql?(7))
  end
  
  def promotion!(x, y)
    if promotable?(x, y)
      pawn_piece = present_piece(x, y)
      pawn_piece.update_attributes(position_x: nil, position_y: nil, dead: true)
      game.pieces.create(type: 'Queen', position_x: x, position_y: y,
      special: 'promoted', color: color)
    end
  end
  
end
