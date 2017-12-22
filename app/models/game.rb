class Game < ApplicationRecord
	belongs_to :user

#I'm not going to try to initialize this just yet in the rails side of things. First I want to get a good idea of how I can style an array on a page!


	def board_setup
		# white
		(0..7).each do |p|
			Pawn.create(

				x_position: p,
				y_position: 1,

			) 

		Rook.create( x_position: 0, y_position: 0)
		Rook.create( x_position: 7, y_position: 0)

		Knight.create( x_position: 1, y_position: 0)
		Knight.create( X_position: 6, y_position: 0)

		Bishop.create( x_position: 2, y_position: 0)
		Bishop.create( x_position: 2, y_position: 0)

		Queen.create( x_position: 3, y_position: 0)
		King.create( x_position: 4, y_position: 0)

		#Black
		(0..7).each do |p|
			Pawn.create(
				x_position: p,
				y_position: 6,

				)

		Rook.create( x_position: 0, y_position: 7)
		Rook.create( x_position: 7, y_position: 7)

		Knight.create( x_position: 1, y_position: 7)
		Knight.create( x_position: 6, y_position: 7)	

		Bishop.create( x_position: 2, y_position: 7)
		Bishop.create( x_position: 5, y_position: 7)

		Queen.create( x_position: 3, y_position: 7)
		King.create( x_position: 4, y_position: 7)
	end
end
end
end

