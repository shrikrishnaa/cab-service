class CreateTravelDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :travel_details do |t|
      t.float :origin_lat
      t.float :origin_long
      t.float :destination_lat
      t.float :destination_long
      t.float :amount
      t.references :cab, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
