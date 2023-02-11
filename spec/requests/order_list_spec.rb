require 'rails_helper'

RSpec.describe "OrderLists", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/order_list/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/order_list/show"
      expect(response).to have_http_status(:success)
    end
  end

end
