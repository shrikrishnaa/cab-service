class AddTimeToTravelDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :travel_details, :start_time, :datetime
    add_column :travel_details, :end_time, :datetime
  end
end
