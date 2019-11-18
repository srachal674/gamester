require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "games#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
