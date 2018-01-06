require 'rails_helper'

RSpec.describe Pawn, type: :model do
  
  describe 'valid_move? method' do
    it "should return true if a valid move" do
        user = FactoryBot.create(:user)
        game = FactoryBot.create(:game, user: user)
        pawn = FactoryBot.create(:pawn, position_x: 0, position_y: 1,  game: game)
        
        expect(pawn.valid_move?(0, 3)).to eq true
    end
  end
  
end
