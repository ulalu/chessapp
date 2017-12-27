require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe 'is_obstructed? method' do
    it "should return true if left is obstructed" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game)
      piece = FactoryBot.create(:piece, position_x: 2, position_y: 0)
      obstruction = FactoryBot.create(:piece, position_x: 1, position_y: 0)
      
      expect(piece.is_obstructed?(0, 0)).to eq(true)
    end
  end
end
