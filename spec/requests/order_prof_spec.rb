require 'rails_helper'

RSpec.describe "OrderProfs", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/order_prof/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/order_prof/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/order_prof/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
