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

	def update
		render status: 400, json: {
			text: 'Invalid Move'
		}
		
		
	end

	def show
		@game = Game.find(params[:id])
	end
	
	private

	# def move_valid?
	# 	@valid_move? ||= Piece
	# end


	def game_create_params
		params.require(:game).permit(:name, :black_id, :white_id)
	end

end

# def http_status
# 	return :ok if move_valid?
# 	:forbidden
# end
