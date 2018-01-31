require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "determine check" do
      let(:user) { FactoryBot.create(:user) }
      let(:game) { FactoryBot.create(:empty_game, user: user) }

      
      it "should be in check if a rook of the opposite color has a clear path to it" do
          bishop = FactoryBot.create(:bishop, position_x: 3, position_y: 3, color: 'white', game: game)
          king = FactoryBot.create(:king, position_x: 0, position_y: 0, color: 'black', game: game)
          
          expect(game.in_check?('black')).to eq true
          
      end
  end
end
