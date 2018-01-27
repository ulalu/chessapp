require 'rails_helper'

RSpec.describe Bishop, type: :model do
		describe 'valid_move?' do
			it "should move diagonally 3 spaces" do
				game = FactoryBot.create(:game)
				bishop = FactoryBot.create(:bishop, position_x: 2, position_y: 0, game: game)

				expect(bishop.valid_move?(5, 3)).to eq(true)
			end
		end		
end
