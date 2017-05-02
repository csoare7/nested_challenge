require "rails_helper"

RSpec.describe RegionsController, type: :controller do
  let!(:region) {create(:region)}
  let!(:first_hs) { create(:first_hs, region: region) }
  let!(:last_hs) { create(:last_hs, region: region) }

  describe "GET #inflate_price" do
    it "returns correct result" do
      get :inflate_price, 
      params: { name: region.name, price: 100000, from: first_hs.date ,to: last_hs.date }, 
      format: :json
      price = JSON.parse(response.parsed_body())["inflated_price"]
      expect(price).to eq(366726)
    end
  end
end
