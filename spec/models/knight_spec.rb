require 'rails_helper'

RSpec.describe Knight, type: :model do

  describe "#valid_move?" do
    # let(:user) { FactoryBot.create(:user) }
    # let(:game) { FactoryBot.create(:game, user: user) }
    # let(:knight) { FactoryBot.create(:knight, position_x: 1, position_y: 0, color: 'black', game: game) }
    
    # it "returns true if valid move" do
    #   expect(knight.valid_move?(0, 2)).to eq true
    # end
    
    # it "returns false if colors are the same" do
    #   obstruction = FactoryBot.create(:piece, position_x: 0, position_y: 2, color: 'white', game: game)
      
    #   expect(knight.valid_move?(0, 2)).to eq false
    # end
    
    # it "returns false if invalid move" do
    #   expect(knight.valid_move?(1, 2)).to eq false
    # end
    
  end
end
