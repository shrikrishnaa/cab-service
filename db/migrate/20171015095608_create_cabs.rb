class CreateCabs < ActiveRecord::Migration[5.1]
  def change
    create_table :cabs do |t|
      t.string :name
      t.string :model
      t.string :number
      t.string :color
      t.float :latitude
      t.float :longitude
      t.integer :available_status

      t.timestamps
    end
  end
end
