# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = nil
@game = nil
if (User.first() == nil)
	puts "Creating user"
	@user = User.create(name: "test user", email: "test@example.com", password: "blah!@#@", password_confirmation:
			"blah!@#@")
else
	puts "One user exists already"
	@user = User.first()
end

puts "Creating game"

if (Game.find_by(user_id: @user.id) == nil)
	puts("Creating a game for user_id: #{@user.id}")
	@game = Game.create(name: "Test game", user_id: @user.id )
else
	@game = Game.find_by(user_id: @user.id)
end

puts "Creating pieces"

if (Piece.find_by(game_id: @game) == nil)

	colors = %w{white black}

	colors.each do |color|
		position_x = 0
		#Create pawns
		8.times do
			if color == "white"
				position_y = 6
				puts("Creating #{color} pawn piece at #{position_y}, #{position_x}")
				Pawn.create(color: color, position_y: position_y, position_x: position_x,
										game_id: @game.id)
				position_x += 1
			elsif color == "black"
				position_y = 1
				puts("Creating #{color} pawn piece at #{position_y}, #{position_x}")
				Pawn.create(color: color, position_y: position_y, position_x: position_x,
										game_id: @game.id)
				position_x += 1
			end
		end
		position_x = 0

		#Create queens
		if color == "white"
			position_y = 7
			position_x = 3
			puts("Creating #{color} queen piece at #{position_y}, #{position_x}")
			Queen.create(color: color, position_y: position_y, position_x: position_x,
									 game_id: @game.id)
		elsif color == "black"
			position_y = 0
			position_x = 3
			puts("Creating #{color} queen piece at #{position_y}, #{position_x}")
			Queen.create(color: color, position_y: position_y, position_x: position_x,
									 game_id: @game.id)
		end

		#Create kings
		if color == "white"
			position_y = 7
			position_x = 4
			puts("Creating #{color} king piece at #{position_y}, #{position_x}")
			King.create(color: color, position_y: position_y, position_x: position_x,
									game_id: @game.id)
		elsif color == "black"
			position_y = 0
			position_x = 4
			puts("Creating #{color} king piece at #{position_y}, #{position_x}")
			King.create(color: color, position_y: position_y, position_x: position_x,
									game_id: @game.id)
		end

		#Create rooks
		rook_positions_x = [0, 7]
		rook_positions_x.each do |x|
			if color == "white"
				position_y = 0
				puts("Creating #{color} rook piece at #{position_y}, #{x}")
				Rook.create(color: color, position_y: position_y, position_x: x,
										game_id: @game.id)
			elsif color == "black"
				position_y = 7
				puts("Creating #{color} rook piece at #{position_y}, #{x}")
				Rook.create(color: color, position_y: position_y, position_x: x,
										game_id: @game.id)
			end

		end

		#Create bishops
		bishop_positions_x = [2, 5]
		bishop_positions_x.each do |x|
			if color == "white"
				position_y = 0
				puts("Creating #{color} bishop piece at #{position_y}, #{x}")
				Bishop.create(color: color, position_y: position_y, position_x: x,
											game_id: @game.id)
			elsif color == "black"
				position_y = 7
				puts("Creating #{color} bishop piece at #{position_y}, #{x}")
				Bishop.create(color: color, position_y: position_y, position_x: x,
											game_id: @game.id)
			end
		end

		#Create knights
		knight_positions_x = [1, 6]
		knight_positions_x.each do |x|
			if color == "white"
				position_y = 0
				puts("Creating #{color} knight piece at #{position_y}, #{x}")
				Knight.create(color: color, position_y: position_y, position_x: x,
											game_id: @game.id)
			elsif color == "black"
				position_y = 7
				puts("Creating #{color} knight piece at #{position_y}, #{x}")
				Knight.create(color: color, position_y: position_y, position_x: x,
											game_id: @game.id)
			end
		end
	end

end


