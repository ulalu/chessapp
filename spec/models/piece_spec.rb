require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe 'obstructed? method' do
    it "should return true if horizontal right is obstructed" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game, user: user)
      piece = FactoryBot.create(:piece, position_x: 0, position_y: 0, game: game)
      obstruction = FactoryBot.create(:piece, position_x: 2, position_y: 0, game: game)
      
      expect(piece.obstructed?(5, 0)).to eq(true)
    end
    
    it "should return true if horizontal left is obstructed" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game, user: user)
      piece = FactoryBot.create(:piece, position_x: 5, position_y: 0, game: game)
      obstruction = FactoryBot.create(:piece, position_x: 2, position_y: 0, game: game)
      
      expect(piece.obstructed?(0, 0)).to eq(true)
    end
    
    it "should return true if vertical up is obstructed" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game, user: user)
      piece = FactoryBot.create(:piece, position_x: 0, position_y: 5, game: game)
      obstruction = FactoryBot.create(:piece, position_x: 0, position_y: 2, game: game)
      
      expect(piece.obstructed?(0, 1)).to eq(true)
    end
    
    it "should return true if vertical down is obstructed" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game, user: user)
      piece = FactoryBot.create(:piece, position_x: 0, position_y: 0, game: game)
      obstruction = FactoryBot.create(:piece, position_x: 0, position_y: 2, game: game)
      
      expect(piece.obstructed?(0, 5)).to eq(true)
    end
    
    it "should return true if diagonal down is obstructed" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game, user: user)
      piece = FactoryBot.create(:piece, position_x: 0, position_y: 0, game: game)
      obstruction = FactoryBot.create(:piece, position_x: 2, position_y: 2, game: game)
      
      expect(piece.obstructed?(4, 4)).to eq(true)
    end
    
    it "should return true if diaganal up is obstructed" do
      user = FactoryBot.create(:user)
      game = FactoryBot.create(:game, user: user)
      piece = FactoryBot.create(:piece, position_x: 4, position_y: 4, game: game)
      obstruction = FactoryBot.create(:piece, position_x: 2, position_y: 2, game: game)
      
      expect(piece.obstructed?(0, 0)).to eq(true)
    end
  end
end
