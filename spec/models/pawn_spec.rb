require 'rails_helper'

RSpec.describe Pawn, type: :model do
  
  describe 'valid_move? method' do
    let(:user) { FactoryBot.create(:user) }
    let(:game) { FactoryBot.create(:game, user: user) }
    let(:pawn) { FactoryBot.create(:pawn, position_x: 0, position_y: 1,  game: game) }
    
    it "should return true if a valid move" do
      expect(pawn.valid_move?(0, 3)).to eq true
    end
    
    it 'returns false if not a valid move' do
      expect(pawn.valid_move?(0, 4)).to eq false
    end
  end
  
end
