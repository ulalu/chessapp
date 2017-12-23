class Piece < ApplicationRecord
  belongs_to :game
  
  def horizontal_obstruct?(end_x, end_y)
    if position_x < end_x # checks from right to left
      (position_x + 1).upto(end_x) do |x|
        return true if occupied?(x, position_y)
      end
    elsif position_x > end_x # checks from left to right
      (position_x - 1).downto(end_x) do |x|
        return true if occupied?(x, position_y)
    end
    # false
  end
  
  def vertical_obstruct?(end_x, end_y)
    if position_y < end_y #checks vertical down
      (position_y - 1).upto(end_y - 1) do |y|
        return true if occupied?(position_x, y)
      end
    elsif position_y > end_y # checks vertical up
      (position_y + 1).downto(end_y, + 1) do |y|
        return true if occupied?(position_x, y)
      end
      # false
    end


  def diagonal_obstruct?(end_x, end_y)
    if position_x < end_x # checks diagonal and up
      (position_x + 1).upto(end_x - 1) do |x|
        diag_y = x - position_x
        y = end_y > position_y ? position_y + diag_y : position_y - diag_y
        return true if occupied?(x, y)
      end
    elsif position_x > end_x # checks diagonal and up
      (position_x - 1).downto(end_x + 1) do |x|
        diag_y = position_x - x
        y = end_y > position_y ? position_y + diag_y : position_y - diag_y
        return true if occupied?(x, y)
      end
    end
    false
  end

end
