require 'rails_helper'

RSpec.describe King, type: :model do
        
        it "should be able to move one square diagonally" do
            game = FactoryBot.create(:game)
            king = FactoryBot.create(:king, position_x: 5, position_y: 0)
            
            diagonal = king.legal?(4, 1)
            expect(diagonal).to be(true)
        end

        
end
