require 'rails_helper'

RSpec.describe King, type: :model do
        describe 'valid_move?' do
            
            it "should be able to move one square diagonally" do
                user = FactoryBot.create(:user)
                game = FactoryBot.create(:game, user: user)
                king = FactoryBot.create(:king, position_x: 5, position_y: 0, game: game)
                
                expect(king.valid_move?(4, 1)).to eq(true)
            end
        end
        
end
