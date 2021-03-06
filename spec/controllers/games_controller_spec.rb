require 'rails_helper'

RSpec.describe GamesController, type: :controller do
    describe "games#index action" do
      
        it "should successfully allow user to access new form" do
          user = FactoryBot.create(:user)
          sign_in user
          get :new
            
          expect(response).to have_http_status(:success)
        end
        
        it 'should redirect user to signin page if not logged in' do
          get :new
            
          expect(response).to redirect_to new_user_session_path
        end
        
        it "should redirect to game show if game create successful" do
          user = FactoryBot.create(:user)
          sign_in user
          
          post :create, params: {
            game: { 
              name: 'grandmaster', 
              user: user 
            }
          }
          game = Game.last
          expect(response).to redirect_to(game_path(game))
        end
    
    end
    
end
