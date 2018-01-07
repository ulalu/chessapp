class King < Piece
    def legal (x, y)
        correct_distance(x, y)
    end
    
    def correct_distance(x, y)
        x_distance = (x - position_x).abs
        y_distance = (y - position_y).abs
        
        (x_distance <= 1) && (y_distance <= 1)
    end
end
