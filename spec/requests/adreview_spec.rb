require 'rails_helper'

RSpec.describe "Adreviews", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/adreview/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/adreview/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/adreview/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
