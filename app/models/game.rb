class Game < ApplicationRecord

  belongs_to :user
  has_many :pieces

  validates :name, presence: true
  after_create :populate_board
	
	
	def populate_board
  	# Populates white pieces in the database
    (0..7).each do |p|
      Pawn.create(game_id: id, type: 'Pawn', color: 'white', position_x: p, position_y: 1)

    end
    
    Rook.create(game_id: id, type: 'Rook', color:'white', position_x: 0, position_y: 0)
    Rook.create(game_id: id, type: 'Rook', color:'white', position_x: 7, position_y: 0)
  
    Knight.create(game_id: id, type: 'Knight', color: 'white', position_x: 1, position_y: 0)
    Knight.create(game_id: id, type: 'Knight', color: 'white', position_x: 6, position_y: 0)
  
  
    Bishop.create(game_id: id, type: 'Bishop', color: 'white', position_x: 2, position_y: 0)
    Bishop.create(game_id: id, type: 'Bishop', color: 'white', position_x: 5, position_y: 0)
  
    Queen.create(game_id: id, type: 'Queen', color: 'white', position_x: 4, position_y: 0)
    King.create(game_id: id, type: 'King', color: 'white', position_x: 3, position_y: 0)
  
  
    # Populates black pieces in the database
    (0..7).each do |p|
      Pawn.create(game_id: id, type: 'Pawn', color: 'black', position_x: p, position_y: 6)
    end
  
    Rook.create(game_id: id, type: 'Rook', color:'black', position_x: 0, position_y: 7)
    Rook.create(game_id: id, type: 'Rook', color:'black', position_x: 7, position_y: 7)
  
    Knight.create(game_id: id, type: 'Knight', color: 'black', position_x: 1, position_y: 7)
    Knight.create(game_id: id, type: 'Knight', color: 'black', position_x: 6, position_y: 7)
  
  
    Bishop.create(game_id: id, type: 'Bishop', color: 'black', position_x: 2, position_y: 7)
    Bishop.create(game_id: id, type: 'Bishop', color: 'black', position_x: 5, position_y: 7)
      
    Queen.create(game_id: id, type: 'Queen', color: 'black', position_x: 4, position_y: 7)
    King.create(game_id: id, type: 'King', color: 'black', position_x: 3, position_y: 7)
  end
  

end

# Will determine if move of friendly piece will cause check 
def put_in_check?(target_x, target_y)
  current_state = false
  ActiveRecord::Base.transaction do
    move_friendly_piece(target_x, target_y)
    current_state = king.where(color: king.color).in_check?
    raise ActiveRecord::Rollback
  end
  reload
  current_state
end  

# The Moving of a friendly piece
def move_friendly_piece(x,y)
  update_attributes(position_x: x, position_y: y)
end


