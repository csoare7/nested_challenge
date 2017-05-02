require 'rails_helper'

RSpec.describe HistoricalSale, type: :model do
  let!(:region) {build(:region, name: "Chelsea")}
  let!(:first_hs) { build(:first_hs, region: region) }
  
  describe "testing validations" do 
    
    it "is valid with valid attributes" do
      expect(first_hs).to be_valid
    end

    it "is not valid without date" do
      expect(build(:first_hs, date: nil)).to_not be_valid
    end

    it "is not valid without index_value" do
      expect(build(:first_hs, index_value: nil)).to_not be_valid
    end

  end

  describe "testing associations" do 
    it "should have many historical_sales" do 
      assoc = described_class.reflect_on_association(:region)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end