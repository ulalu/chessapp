class Game < ApplicationRecord

  belongs_to :user
  has_many :pieces

  validates :name, presence: true
	
  def populate_board
  # white
    (0..7).each do |p|
      Pawn.create(game_id: id, type: 'Pawn', special: 'empty', color: 'White', position_x: p, position_y: 1)
    end
    
    Rook.create(game_id: id, type: 'Rook', special: 'empty', color:'White', position_x: 0, position_y: 0)
    Rook.create(game_id: id, type: 'Rook', special: 'empty', color:'White', position_x: 7, position_y: 0)
    
    Knight.create(game_id: id, type: 'Knight', special: 'empty', color: 'White', position_x: 1, position_y: 0)
    Knight.create(game_id: id, type: 'Knight', special: 'empty', color: 'White', position_x: 6, position_y: 0)
    
    
    Bishop.create(game_id: id, type: 'Bishop', special: 'empty', color: 'White', position_x: 2, position_y: 0)
    Bishop.create(game_id: id, type: 'Bishop', special: 'empty', color: 'White', position_x: 5, position_y: 0)
    
    Queen.create(game_id: id, type: 'Queen', special: 'empty', color: 'White', position_x: 3, position_y: 0)
    King.create(game_id: id, type: 'King', special: 'empty', color: 'White', position_x: 4, position_y: 0)
  
    
    #Black
    (0..7).each do |p|
      Pawn.create(game_id: id, type: 'Pawn', special: 'empty', color: 'Black', position_x: p, position_y: 6)
    end
    
    Rook.create(game_id: id, type: 'Rook', special: 'empty', color:'Black', position_x: 0, position_y: 7)
    Rook.create(game_id: id, type: 'Rook', special: 'empty', color:'Black', position_x: 7, position_y: 7)
    
    Knight.create(game_id: id, type: 'Knight', special: 'empty', color: 'Black', position_x: 1, position_y: 7)
    Knight.create(game_id: id, type: 'Knight', special: 'empty', color: 'Black', position_x: 6, position_y: 7)
    
    
    Bishop.create(game_id: id, type: 'Bishop', special: 'empty', color: 'Black', position_x: 2, position_y: 7)
    Bishop.create(game_id: id, type: 'Bishop', special: 'empty', color: 'Black', position_x: 5, position_y: 7)
    
    Queen.create(game_id: id, type: 'Queen', special: 'empty', color: 'Black', position_x: 3, position_y: 7)
    King.create(game_id: id, type: 'King', special: 'empty', color: 'Black', position_x: 4, position_y: 7)
  end
end

