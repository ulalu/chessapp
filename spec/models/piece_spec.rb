require 'rails_helper'

RSpec.describe Piece, type: :model do
  
  let(:user) { FactoryBot.create(:user) }
  let(:game) { FactoryBot.create(:game, user: user) }
  
  describe '#obstructed?' do
    describe '#horizontal_obstruct' do
    
      before do
        game.pieces.map do |piece|
          piece.destroy!
        end
      end
      
      describe 'horizontal right' do
        let(:piece) { FactoryBot.create(:piece, position_x: 0, position_y: 0, game: game) } 
        
        it 'returns true if horizontal right is obstructed' do
          obstruction = FactoryBot.create(:piece, position_x: 2, position_y: 0, game: game)
          
          expect(piece.horizontal_obstruct?(5)).to eq true
        end
        
        it 'returns false if horizontal right isnt obstructed' do
          expect(piece.horizontal_obstruct?(5)).to eq false
        end
      end
      
      describe 'horizontal left' do
        let(:piece) { FactoryBot.create(:piece, position_x: 5, position_y: 0, game: game) }
        
        it 'returns true if horizontal left is obstructed' do
          obstruction = FactoryBot.create(:piece, position_x: 2, position_y: 0, game: game)
          
          expect(piece.horizontal_obstruct?(0)).to eq true
        end
        
        it 'returns false if horizontal left isnt obstructed' do
          expect(piece.horizontal_obstruct?(0)).to eq false
        end
      end
    end
    
    describe '#diagonal_obstruct?' do
      
      before do 
        game.pieces.map do |piece|
          piece.destroy!
        end
      end
    
      describe 'diagonal down' do
        let(:piece) { FactoryBot.create(:piece, position_x: 0, position_y: 0, game: game) }
        
        it 'returns true if diagonal down is obstructed' do
          obstruction = FactoryBot.create(:piece, position_x: 2, position_y: 2, game: game)
          
          expect(piece.diagonal_obstruct?(4, 4)).to eq true
        end
        
        it 'returns false if diagonal down isnt obstructed' do
          expect(piece.diagonal_obstruct?(4, 4)).to eq false
        end
      end
      
      describe 'diagonal up' do
        let(:piece) { FactoryBot.create(:piece, position_x: 4, position_y: 4, game: game) }
        
        it 'returns true if diagonal up is obstructed' do
          obstruction = FactoryBot.create(:piece, position_x: 2, position_y: 2, game: game)
        
          expect(piece.diagonal_obstruct?(0, 0)).to eq true
        end
        
        it 'returns false if diagonal up isnt obstructed' do
          expect(piece.diagonal_obstruct?(0, 0)).to eq false
        end
      end
    end 
    
    describe '#vertical_obstruct?' do
  
      before do
        game.pieces.map do |piece|
          piece.destroy!
        end
      end
      
      describe 'vertical down' do
        let(:piece) { FactoryBot.create(:piece, position_x: 0, position_y: 1, game: game) }
        
        it 'returns true if obstructed' do
          obstruction = FactoryBot.create(:piece, position_x: 0, position_y: 3, game: game)
        
          expect(piece.vertical_obstruct?(5)).to eq true
        end
  
        it 'returns false if not obstructed' do
          expect(piece.vertical_obstruct?(5)).to eq false
        end
      end
      
      describe 'vertical up' do
        let(:piece) { FactoryBot.create(:piece, position_x: 0, position_y: 7, game: game) }
        
        it 'returns true when occupied' do
          obstruction = FactoryBot.create(:piece, position_x: 0, position_y: 5, game: game)
        
          expect(piece.vertical_obstruct?(3)).to eq true
        end
        
         it 'returns false when not occupied' do
           expect(piece.vertical_obstruct?(0)).to eq false
         end
      end
      
      
    end
  end
  
  describe '#capture!' do
      
      before do
        game.pieces.map do |piece|
          piece.destroy!
        end
      end
      
      it "update captured piece values to reflect capture" do
        rook = FactoryBot.create(:rook, position_x: 0, position_y: 0, color: 'white', game: game)
        piece = FactoryBot.create(:piece, position_x: 0, position_y: 3, color: 'black', game: game)
        
        rook.capture!(0, 3)
    
        piece.reload
        
        expect(rook.position_x).to eq 0
        expect(rook.position_y).to eq 3
        
        expect(piece.position_x).to eq nil
        expect(piece.position_y).to eq nil
        expect(piece.dead).to eq true 
      
      end
      
      it "return true if pieces are the same color" do
        piece1 = FactoryBot.create(:piece, position_x: 0, position_y: 0, color: 'black', game: game)
        piece2 = FactoryBot.create(:piece, position_x: 0, position_y: 3, color: 'black', game: game)
        
        expect(piece1.is_same_color?(0, 3)).to eq true
      end
      
      it "returns false is not same color" do
        piece1 = FactoryBot.create(:piece, position_x: 0, position_y: 0, color: 'black', game: game)
        piece2 = FactoryBot.create(:piece, position_x: 0, position_y: 3, color: 'white', game: game)
        
        expect(piece1.is_same_color?(0, 3)).to eq false
      end
      
      it "updates piece location" do
        piece = FactoryBot.create(:piece, position_x: 0, position_y: 0, color: 'black', game: game)
       
        piece.move_to!(0, 3)
        piece.reload
        
        expect(piece.position_x).to eq 0
        expect(piece.position_y).to eq 3
      end
      
      it "returns true if a piece is present" do
        piece1 = FactoryBot.create(:piece, position_x: 0, position_y: 0, color: 'black', game: game)
        piece2 = FactoryBot.create(:piece, position_x: 0, position_y: 3, color: 'white', game: game)
        
        expect(piece1.piece_present_at?(0, 3)).to eq true
      end
      
      
      it "returns true if present piece is capturable?" do
        piece1 = FactoryBot.create(:piece, position_x: 0, position_y: 0, color: 'black', game: game)
        piece2 = FactoryBot.create(:piece, position_x: 0, position_y: 3, color: 'white', game: game)
        
        expect(piece1.capturable?(0, 3)).to eq true
      end
      
      it "returns false if present piece isnt capturable?" do
        piece1 = FactoryBot.create(:piece, position_x: 0, position_y: 0, color: 'black', game: game)
        piece2 = FactoryBot.create(:piece, position_x: 0, position_y: 3, color: 'black', game: game)
        
        expect(piece1.capturable?(0, 3)).to eq false
      end
    end
    
    describe 'valid_move' do
      
      it "should return false if the piece has been moved off the board" do
        piece1 = FactoryBot.create(:piece)
        
        expect(piece1.valid_move?(-1, 0)).to eq false
        expect(piece1.valid_move?(0, 9)).to eq false
      end 
    end
end