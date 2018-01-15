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
  
  def in_check?(king)
    opposite_pieces = pieces.where(color: !king.color)
    opposite_pieces.each do |piece|
      if piece.valid_move?(king.position_x, king.position_y)
        return true
      else
        return false
      end
    end
  end
  
  def not_moved_to_different_space?(x,y)
    position_x == x && y_position == y
  end
  
  def valid_move_to?(x,y)
    #not sure the in_check can be used this way, i think i need to write another method which prevents user 
    #from moving king into check and use that instead
    obstructed?(x,y) && off_the_board?(x,y) && not_moved_to_different_space?(x,y) && valid_move?(x,y)
    #piece specific logic, i think this all needs to be refactored to have the same method name for checking the piece move logic
  end
  
end

