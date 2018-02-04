class Piece < ApplicationRecord

  belongs_to :game
   # Determines if a piece can be captured
 	def capturable?(x, y)
 	  (piece_present_at?(x, y)) && !is_same_color?(x, y)
 	end
 	
 	# Captures present piece if is capturable (changes db)
 	def capture!(x, y)
 	  if piece_present_at?(x, y)
 		  if capturable?(x, y)
 		    update_captured_piece!(x, y)
 		    move_to!(x, y)
       end
 		else
 		  move_to!(x, y)
 		end
 	end
   
 	# Changes captured piece attributes to reflect capture (changes db)
 	def update_captured_piece!(x, y)
 	  self.present_piece(x, y).update_attributes(position_x: nil, position_y: nil, dead: true)
 	end
 	
 	# Updates a piece location based on given coordinates (changes db)
 	def move_to!(x, y)
 	  self.update_attributes(position_x: x, position_y: y)
 	end
 
  # Checks if a piece is present at given location.
  def piece_present_at?(x, y)
    game.pieces.exists?(position_x: x, position_y: y)
  end

	# Checks if pieces have same color
	def is_same_color?(x, y)
 		game.pieces.find_by(position_x: x, position_y: y).color == self.color
	end

	# returns a piece object from given coordinates
	def present_piece(x, y)
		game.pieces.find_by(position_x: x, position_y: y)
 	end
 
# Determines if a piece can be captured
 def capturable?(x, y)
	 (piece_present_at?(x, y)) && !is_same_color?(x, y)
 end

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
      return true
    else
      return false
    end
  end
  
  def examine_path(x,y)
    if position_y == y
      'horizontal'
    elsif position_x == x
      'vertical'
    elsif (y - position_y).abs == (x - position_x).abs
      'diagonal'
    end
  end
  
  # Checks checks for horizontal obstruction
  def horizontal_obstruct?(x)
    # Checks horizontal left
    if position_x < x 
      (position_x + 1).upto(x - 1) do |x|
        return true if square_occupied?(x, position_y)
      end
    # Checks right
    elsif position_x > x
      (position_x - 1).downto(x + 1) do |x|
        return true if square_occupied?(x, position_y)
      end
    end
    false
  end
  
  # Checks for vertical obstruction
  def vertical_obstruct?(y)
    # checks vertical down
    if position_y < y
      (position_y + 1).upto(y - 1) do |y|
        return true if square_occupied?(position_x, y)
      end
    # checks vertical up
    elsif position_y > y
      (position_y - 1).downto(y + 1) do |y|
        return true if square_occupied?(position_x, y)
      end
    end
    false
  end

  # Checks for diagonal_obstruction
  def diagonal_obstruct?(x, y)
    # Checks diagonal and down
    if position_x < x
      ((position_x + 1)...x).each do |intermediate_x|
        y_change = intermediate_x - position_x
        intermediate_y = y > position_y ? position_y + y_change : position_y - y_change
        if square_occupied?(intermediate_x, intermediate_y)
          return true
        end
      end
    # Checks diagonal and up
    elsif position_x > x
      ((x + 1)...position_x).each do |intermediate_x|
        y_change = position_x - intermediate_x
        intermediate_y = y > position_y ? position_y + y_change : position_y - y_change
        return true if square_occupied?(intermediate_x, intermediate_y)
      end
    end
    false
  end
  
  # Checks if square is occupied
  def square_occupied?(x, y)
    game.pieces.where(position_x: x, position_y: y).present?
  end
  
  def examine_path(x, y)
    if position_y == y
      'horizontal'
    elsif position_x == x
      'vertical'
    elsif (y - position_y).abs == (x - position_x).abs
      'diagonal'
    end
  end
  
  # checks the path based on provided coodinates for obstruction
  def obstructed?(x,y)
    path = examine_path(x,y)
    
    case path
    when 'horizontal'
      horizontal_obstruct?(x)
    when 'vertical'
      vertical_obstruct?(y)
    when 'diagonal'
      diagonal_obstruct?(x, y)
    else
      false
    end
  end
  
  def not_moved_to_different_space?(x,y)
    position_x == x && position_y == y
  end
  
  # def is_my_turn?
  #   user_id == game.turn
  # end
  
  def occupied?(x,y)
	  (piece_present_at?(x,y)) && is_same_color?(x,y)
	end
  
  def valid_move?(x,y,color = nil)
    return false if obstructed?(x,y) 
    return false if off_the_board?(x,y)
    #return false if in_check?(color)
    return false if not_moved_to_different_space?(x,y)
    return false if occupied?(x,y)
    #return false if is_my_turn?
    return true
  end
  
  def valid_move_reason(x,y)
    if !valid_move?(x,y)
      return 'there is a piece between your start and end point' if obstructed?(x,y) 
      return "you cannot place your piece off the board" unless off_the_board?(x,y)
      #return "if you make this move your king is in check" if in_check?(king)
      return "you haven't moved your piece" unless not_moved_to_different_space?(x,y)
      return "you cannot move a piece on top of your own pieces" if occupied?(x,y)
      return "wait for your turn" unless is_my_turn?
    end
  end
  
  def change_turns
    valid_move?(x,y)
    if user_id == game.white_id
      game.update_attributes(turn: game.black_id)
    else
      game.update_attributes(turn: game.white_id)
    end
  end
  
  
  
end

