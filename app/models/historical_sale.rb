class HistoricalSale < ApplicationRecord
  validates :date, :index_value, presence: true
  validates :index_value, numericality: true
  
  belongs_to :region
end
