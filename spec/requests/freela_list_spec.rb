require 'rails_helper'

RSpec.describe "FreelaLists", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/freela_list/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/freela_list/show"
      expect(response).to have_http_status(:success)
    end
  end

end
