require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/profile/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/profile/show"
      expect(response).to have_http_status(:success)
    end
  end

end
