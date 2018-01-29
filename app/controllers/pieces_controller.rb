class PiecesController < ApplicationController
    def update
        @piece = Piece.find(params[:id])
        if is_my_turn? && valid_move?(x,y)
            @piece.move_to!(piece_params[:x_position], piece_params[:y_position])
        end
    end
   
   private
   
   def piece_params
       @piece_params = params.require(:piece).permit(:x_position, :y_position)
   end
    
end
