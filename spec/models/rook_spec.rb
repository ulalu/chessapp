require 'rails_helper'

RSpec.describe Rook, type: :model do
		describe 'valid' do
			it "should move vertically 4 spaces" do
				user = FactoryBot.create(:user)
				game = FactoryBot.create(:game, user: user)
				rook = FactoryBot.create(:rook, position_x: 0, position_y: 0, game: game)

				expect(rook.valid_move?(0, 4)).to eq(true)
			end
		end
end
