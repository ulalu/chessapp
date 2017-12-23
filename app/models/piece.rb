class Piece < ApplicationRecord
  belongs_to :game
  
  def horizontal_obstruct?(end_x, end_y)
    if position_x < end_x # checks from right to left
      (position_x + 1).upto(end_x) do |x|
        return true if occupied?(x, position_y)
      end
    elsif position_x > end_x # checks from left to right
      (position_x - 1).upto(end_x) do |x|
        return true if occupied?(x, position_y)
    end
  end
  # false
end
