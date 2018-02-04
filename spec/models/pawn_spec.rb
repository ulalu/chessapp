require 'rails_helper'

RSpec.describe Pawn, type: :model do
  
  describe '#valid_move?' do
    let(:user) { FactoryBot.create(:user) }
    let(:game) { FactoryBot.create(:empty_game, user: user) }
    let(:pawn) { FactoryBot.create(:pawn, position_x: 0, position_y: 1,  game: game) }
    
    it "should return true if a valid move" do
      expect(pawn.valid_move?(0, 3)).to eq true
    end
    
    it "returns false if obstructed" do
      obstruction = FactoryBot.create(:piece, position_x: 0, position_y: 2, game: game)
      expect(pawn.valid_move?(0, 3)).to eq false
    end
    
    it 'returns false if not a valid move' do
      expect(pawn.valid_move?(0, 4)).to eq false
    end
  end
  
  describe '#promotable?' do
    let(:user) { FactoryBot.create(:user) }
    let(:game) { FactoryBot.create(:game, user: user) }
    
    it 'returns true if pawn is promotable?' do
      pawn = FactoryBot.create(:pawn, position_x: 2, position_y: 0, color: 'black', game: game)
      
      expect(pawn.promotable?).to eq true
    end
    
    it 'returns false if not promotable?' do
      pawn = FactoryBot.create(:pawn, position_x: 2, position_y: 0, color: 'white', game: game)
      
      expect(pawn.promotable?).to eq false
    end
  end
  
  describe '#promote!' do
    let(:user) { FactoryBot.create(:user) }
    let(:game) { FactoryBot.create(:game, user: user) }
    
    it 'returns type queen if promotion successful' do
      pawn = FactoryBot.create(:pawn, position_x: 2, position_y: 0, color: 'black', game: game)
      pawn.promote!(2, 0)
      expect(game.pieces.find_by(position_x: 2, position_y: 0).type).to eql 'Queen'
    end
    
  end
  
end
