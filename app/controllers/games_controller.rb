class GamesController < ApplicationController
	before_action :authenticate_user!

	def index
		@games = Game.all
	end

	def new 
		@game = Game.new
	end
	
	def create
		@game = current_user.games.create(game_create_params)
		if @game.valid?
			redirect_to game_path(@game)
		else
			redirect_to root_path, alert: "Could not create game."
		end
	end

	def move
		@piece = Piece.find(params[:piece_id])
		# if @piece.valid_move?(params[:position_x], params[:position_y])
		# 	@piece.update_attributes(:position_x, :position_y)
		if true
			render status: 200, json: {valid: true}
		else
			render status: :unauthorized, json: {valid: false}
		end

	end

	def show
		@game = Game.find(params[:id])
	end
	
	private

	def piece_params
		params.require(:piece).permit(:piece_id, :position_x, :position_y)
	end

	def game_create_params
		params.require(:game).permit(:name, :email)
	end

end


