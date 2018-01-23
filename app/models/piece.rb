class Piece < ApplicationRecord

  belongs_to :game
  
  # Determine if space has a piece present and isnt nil
  def obstruction_present?(x, y)
    game.pieces.find_by(position_x: x, position_y: y).nil?
  end
  
  # Determines if Piece color is black
  def black?
    color.eql?('black')
  end
  
  # Determines if Piece color is white
  def white?
    color.eql?('white')
  end
  
  # Determines if pieces is being moved off board
  def off_the_board?(x, y)
    if (x < 0 || y < 0 || x > 7 || y > 7 )
      return false
    else
      return true
    end
  end
  
  def examine_path(position_x, position_y, end_x, end_y)
    if position_y == end_y
      'horizontal'
    elsif position_x == end_x
      'vertical'
    elsif (end_y - position_y).abs == (end_x - position_x).abs
      'diagonal'
    end
  end
  
  # Checks checks for horizontal obstruction
  def horizontal_obstruct?(end_x)
    # Checks horizontal left
    if position_x < end_x 
      (position_x + 1).upto(end_x - 1) do |x|
        return true if square_occupied?(x, position_y)
      end
    # Checks right
    elsif position_x > end_x
      (position_x - 1).downto(end_x + 1) do |x|
        return true if square_occupied?(x, position_y)
      end
    end
    false
  end
  
  # Checks for vertical obstruction
  def vertical_obstruct?(end_y)
    # checks vertical down
    if position_y < end_y
      (position_y + 1).upto(end_y - 1) do |y|
        return true if square_occupied?(position_x, y)
      end
    # checks vertical up
    elsif position_y > end_y
      (position_y - 1).downto(end_y + 1) do |y|
        return true if square_occupied?(position_x, y)
      end
    end
    false
  end

  # Checks for diagonal_obstruction
  def diagonal_obstruct?(end_x, end_y)
    # Checks diagonal and down
    if position_x < end_x
      (position_x + 1).upto(end_x - 1) do |x|
        diag_y = x - position_x
        y = end_y > position_y ? position_y + diag_y : position_y - diag_y
        return true if square_occupied?(x, y)
      end
    # Checks diagonal and up
    elsif position_x > end_x
      (position_x - 1).downto(end_x + 1) do |x|
        diag_y = position_x - x
        y = end_y > position_y ? position_y + diag_y : position_y - diag_y
        return true if square_occupied?(x, y)
      end
    end
    false
  end
  
  # Checks if square is occupied
  def square_occupied?(x, y)
    game.pieces.where(position_x: x, position_y: y).present?
  end
  
  def examine_path(position_x, position_y, end_x, end_y)
    if position_y == end_y
      'horizontal'
    elsif position_x == end_x
      'vertical'
    elsif (end_y - position_y).abs == (end_x - position_x).abs
      'diagonal'
    end
  end
  
  # checks the path based on provided coodinates for obstruction
  def obstructed?(x, y)
    path = examine_path(position_x, position_y, x, y)
    
    if path
      return horizontal_obstruct?(x) if path == 'horizontal'
  
      return vertical_obstruct?(y) if path == 'vertical'
  
      return diagonal_obstruct?(x, y) if path == 'diagonal'
    else
      return false
    end
  end
  
  def in_check?(king)
    opposite_pieces = pieces.where(color: !king.color)
    opposite_pieces.each do |piece|
      if piece.valid_move?(king.position_x, king.position_y)
        return true
      else
        return false
      end
    end
  end
  
  def not_moved_to_different_space?(x,y)
    position_x == x && y_position == y
  end
  
  def is_my_turn?
    #write logic to check for whether it's the piece owner's turn here!
    #maybe something like... @game.turcann == current_player.color???? with the turn defined by color elsewhere?
  end
  
  def valid_move?(x,y,king)
    invalid_reason = Hash.new
    if obstructed?(x,y)
      return false
      invalid_reason['invalid'] = "there is a piece between your start and end point"
      return invalid_reason
    elsif off_the_board?(x,y) == true
      return false 
      invalid_reason['invalid'] = "you cannot place your piece off the board"
      return invalid_reason['invalid']
    elsif in_check?(king)
      return false
      invalid_reason['invalid'] = "if you make this move your king is in check"
      return invalid_reason['invalid']
    elsif not_moved_to_different_space?(x,y) == true
      return false
      invalid_reason['invalid'] = "you haven't moved your piece"
      return invalid_reason['invalid']
    #this portion will need to be refactored based on turn logic
    elsif is_my_turn?
      return false
      invalid_reason['invalid'] = 'wait for your turn.'
      return invalid_reason['invalid']
    else
      return true
    end
    
  
    return false, 'wait for your turn' if is_my_turn? #this will need editing depending on turn logic
    true
  end
    
    
  end
    
  
end
