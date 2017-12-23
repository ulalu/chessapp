class Piece < ApplicationRecord
  belongs_to :game
  
  def is_obstructed?(end_x, end_y)
    horizontal_obstruct?(end_x, end_y)
    vertical_obstruct?(end_x, end_y)
    diagonal_obstruct?(end_x, end_y)
  end
  
  # Gets piece current pos and checks space between piece current pos to piece dest 
  def horizontal_obstruct?(end_x, end_y)
    if self.position_x < end_x # checks from right to left
      (self.position_x + 1).upto(end_x) do |x|
        return true if occupied?(x, self.position_y)
      end
    elsif self.position_x > end_x # checks from left to right
      (self.position_x - 1).downto(end_x) do |x|
        return true if occupied?(x, self.position_y)
      end
      false
    end
  end
  
  def vertical_obstruct?(end_x, end_y)
    if self.position_y < end_y #checks vertical down
      (self.position_y - 1).upto(end_y - 1) do |y|
        return true if occupied?(self.position_x, y)
      end
    elsif self.position_y > end_y # checks vertical up
      (self.position_y + 1).downto(end_y, + 1) do |y|
        return true if occupied?(self.position_x, y)
      end
    end
    # false
  end

def diagonal_obstruct?(end_x, end_y)
  if self.position_x < end_x # checks diagonal and up
    (self.position_x + 1).upto(end_x - 1) do |x|
      diag_y = x - self.position_x
      y = end_y > self.position_y ? self.position_y + diag_y : self.position_y - diag_y
      return true if occupied?(x, y)
    end
  elsif self.position_x > end_x # checks diagonal and up
    (self.position_x - 1).downto(end_x + 1) do |x|
      diag_y = self.position_x - x
      y = end_y > self.position_y ? self.position_y + diag_y : self.position_y - diag_y
      return true if occupied?(x, y)
    end
  end
  false
end

  
  
  
  
  
end
