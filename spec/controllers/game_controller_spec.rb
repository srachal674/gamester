require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "games#index" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#create" do
    it "should redirect you to login if not logged in." do
      get :create
      expect(response).to have_http_status(:redirect)
    end
  end

end