require 'rails_helper'

RSpec.describe Queen, type: :model do
		describe 'valid' do
			it "should move horizontally 2 spaces" do
				user = FactoryBot.create(:user)
				game = FactoryBot.create(:empty_game, user: user)
				queen = FactoryBot.create(:queen, position_x: 3, position_y: 0, game: game)

				expect(queen.valid_move?(5, 0)).to eq(true)
			end
			it "should move diagonally 2 spaces" do
				user = FactoryBot.create(:user)
				game = FactoryBot.create(:empty_game, user: user)
				queen = FactoryBot.create(:queen, position_x: 3, position_y: 0, game: game)

				expect(queen.valid_move?(5, 2)).to eq(true)
			end	
		end
end	
