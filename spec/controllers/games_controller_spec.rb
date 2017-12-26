require 'rails_helper'

RSpec.describe GamesController, type: :controller do
    describe "games#index action" do
        it "should show the new game page" do
            get :new
            expect(response).to have_http_status(:success)
        end
        
        it "should show the create game page" do
            get :create
            expect(response).to have_http_status(:success)
        end
        
        it "should show the game" do
            get :show
            expect(response).to have_http_status(:success)
        end
    end
    
end
