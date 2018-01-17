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
			# redirect to a new path that has the modal and THEN
			# redirect to game path, showing whichever board is appropriate to their choice of army

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
