require "csv"
require File.expand_path('../../../config/environment',  __FILE__)
require "region"

regions = {}

file = "./data/data.csv"

CSV.foreach(file, :headers => true, :header_converters => :symbol, :converters => :all) do |row|
  region_name = row.fields[1]
  index_date = row.fields[0]
  index_value = row.fields[4]

  r = Region.find_or_create_by(name: region_name)
  r.historical_sales.create(date: index_date, index_value: index_value)
end

