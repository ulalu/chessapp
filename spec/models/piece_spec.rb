require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe 'obstructed? method' do
    it "should return true if right is obstructed" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game, user: user)
      piece = FactoryBot.create(:piece, position_x: 0, position_y: 0, game: game)
      obstruction = FactoryBot.create(:piece, position_x: 2, position_y: 0, game: game)
      
      expect(piece.obstructed?(5, 0)).to eq(true)
    end
  end
end
