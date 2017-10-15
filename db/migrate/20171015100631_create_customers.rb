class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
    add_index :customers, :email, unique: true
  end
end
