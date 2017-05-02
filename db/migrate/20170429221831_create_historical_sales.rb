class CreateHistoricalSales < ActiveRecord::Migration[5.0]
  def change
    create_table :historical_sales do |t|
      t.decimal :index_value, null: false
      t.date :date, null: false
      t.timestamps
      t.index :date
    end
    add_reference :historical_sales, :region, index:true
    add_foreign_key :historical_sales, :regions
  end
end
