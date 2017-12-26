class GamesController < ApplicationController
	before_action :authenticate_user!

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

	def show
		@game = Game.find(params[:id])
	end
	
	private
	
	def current_game
		@current_game ||= Game.find(params[:id])
	end
	
	def game_create_params
		params.require(:game).permit(:name)
	end

end