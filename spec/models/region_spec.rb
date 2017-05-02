require 'rails_helper'

RSpec.describe Region, type: :model do
  let!(:region) { build(:region) }
  
  describe "testing validations" do 
    
    it "is valid with valid attributes" do
      expect(region).to be_valid
    end

    it "is not valid without name" do
      expect(build(:region, name: nil)).to_not be_valid
    end
  end

  describe "testing associations" do 
    it "should have many historical_sales" do 
      assoc = described_class.reflect_on_association(:historical_sales)
      expect(assoc.macro).to eq :has_many
    end
  end
end