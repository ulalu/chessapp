class Piece < ApplicationRecord
  belongs_to :game

  def occupied?(x, y)
    game.pieces.where(x_position: x, y_position: y).present?
  end

  def obstructed?(end_x, end_y)
    horizontal_obstruct?(end_x, end_y)
    vertical_obstruct?(end_x, end_y)
    diagonal_obstruct?(end_x, end_y)
  end

  # Checks btw piece and desired position for obstruction on horizontal.
  # _end_y indicates var wont be used.
  def horizontal_obstruct?(end_x, _end_y)
    if position_x < end_x # checks from right to left
      (position_x + 1).upto(end_x) do |x|
        return true if occupied?(x, position_y)
      end
    elsif position_x > end_x # checks from left to right
      (position_x - 1).downto(end_x) do |x|
        return true if occupied?(x, position_y)
      end
      false
    end
  end
  
  def vertical_obstruct?(_end_x, end_y)
    vertical_down_obstruct?(end_x, end_y)
    vertical_up_obstruct?(end_x, end_y)
  end

  # Checks btw piece and desired position for obstruction on vertical.
  def vertical_down_obstruct?(_end_x, end_y)
    if position_y < end_y # checks vertical down
      (position_y - 1).upto(end_y - 1) do |y|
        return true if occupied?(position_x, y)
      end
    end
    false
  end

  def vertical_up_obstruct?(_end_x, end_y)
    if position_y > end_y # checks vertical up
      (position_y + 1).downto(end_y, + 1) do |y|
        return true if occupied?(position_x, y)
      end
    end
    false
  end

  # Checks btw piece and desired position for obstruction on diagonal.
  def diagonal_obstruct?(end_x, end_y)
    diagonal_down_obstruct?(end_x, end_y)
    diagonal_up_obstruct?(end_x, end_y)
  end

  def diagonal_up_obstruct?(end_x, end_y)
    if position_x < end_x
      (position_x + 1).upto(end_x - 1) do |x|
        diag_y = x - position_x
        y = end_y > position_y ? position_y + diag_y : position_y - diag_y
        return true if occupied?(x, y)
      end
    end
    false
  end

  def diagonal_down_obstruct?(end_x, end_y)
    if position_x > end_x # checks diagonal and up
      (position_x - 1).downto(end_x + 1) do |x|
        diag_y = position_x - x
        y = end_y > position_y ? position_y + diag_y : position_y - diag_y
        return true if occupied?(x, y)
      end
    end
    false
  end
end
