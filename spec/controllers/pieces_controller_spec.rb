require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
    let(:user) { FactoryBot.create(:user) }
    let(:game) { FactoryBot.create(:empty_game, user: user, white_id: user, turn: white_id) }
    
    describe "update turn information" do
        it "should update the piece information" do
            
			game = FactoryBot.create(:game)
			bishop = FactoryBot.create(:bishop, position_x: 3, position_y: 3, game: game, color: 'white')

			expect(bishop.valid_move?(6, 6)).to eq(true)
			expect(bi)
		end
        
        it "should update the turn" do
        end
    end
    
end
