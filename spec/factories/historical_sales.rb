FactoryGirl.define do
  factory :historical_sale do
  
    factory :first_hs do
      date "01-01-2000"
      index_value 28.25
    end

    factory :last_hs do
      date "01-01-2016"
      index_value 103.60
    end

    association :region, factory: :region
  end
end
