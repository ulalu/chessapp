class GamesController < ApplicationController
	before_action :authenticate_user!

	def index
		@games = Game.all
	end

	def new 
		@game = Game.new
	end
	
	# create a method for a flipped board
	# keep pieces in correct places in database (coordinates)

	def create
		@game = current_user.games.new(game_create_params)
		if params[:white_id].present?
			@game.white_id = current_user.id 
		else
			@game.black_id = current_user.id
		end

		if @game.save
			redirect_to game_path(@game)
		else
			flash[:error] = @game.errors.full_messages.join(", ")
			render :new
		end
	end

	def join
		@game = Game.find(params[:game_id])
		redirect_to game_path(@game)
			if @game.white_id.present?
				current_user.id == @game.black_id
			elsif @game.black_id.present?
				current_user.id == @game.white_id
			else
			end
	end

	def move
		@piece = Piece.find(params[:piece_id])
		# if @piece.valid_move?(params[:position_x], params[:position_y])
		# 	@piece.update_attributes(:position_x, :position_y)
		if false
			render status: 200, json: {valid: true}
		else
			flash[:notice] = "Invalid move"
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
		params.require(:game).permit(:name, :email, :white_id, :black_id)
	end

end

