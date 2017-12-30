class Piece < ApplicationRecord

  belongs_to :game
  
  def examine_path(position_x, position_y, end_x, end_y)
    if position_y == end_y
      'horizontal'
    elsif position_x == end_x
      'vertical'
    elsif (end_y - position_y).abs == (end_x - position_x).abs
      'diagonal'
    end
  end

  def off_the_board(x, y)
    return 'invalid' if(x < 0 || y < 0 || x > 7 || y > 7)
  end

  # Checks btw piece and desired position for obstruction on horizontal.
  def horizontal_obstruct?(end_x)
    if position_x < end_x # checks from right to left
      (position_x + 1).upto(end_x - 1) do |x|
        return true if square_occupied?(x, position_y)
      end
    elsif position_x > end_x # checks from left to right
      (position_x - 1).downto(end_x + 1) do |x|
        return true if square_occupied?(x, position_y)
      end
    end
    false
  end
  
  # Checks btw piece and desired position for obstruction on vertical.
  def vertical_obstruct?(end_y)
    if position_y < end_y # checks vertical down
      (position_y + 1).upto(end_y - 1) do |y|
        return true if square_occupied?(position_x, y)
      end
    elsif position_y > end_y # checks vertical up
      (position_y - 1).downto(end_y + 1) do |y|
        return true if square_occupied?(position_x, y)
      end
    end
    false
  end

  def diagonal_obstruct?(end_x, end_y)
    if position_x < end_x
      (position_x + 1).upto(end_x - 1) do |x|
        diag_y = x - position_x
        y = end_y > position_y ? position_y + diag_y : position_y - diag_y
        return true if square_occupied?(x, y)
      end
    elsif position_x > end_x # checks diagonal and up
      (position_x - 1).downto(end_x + 1) do |x|
        diag_y = position_x - x
        y = end_y > position_y ? position_y + diag_y : position_y - diag_y
        return true if square_occupied?(x, y)
      end
    end
    false
  end
  
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
  
end # end of class