class TravelDetail < ApplicationRecord
  belongs_to :cab
  belongs_to :customer
  around_save :update_cab_status
  before_update :calculate_traveled_charge, :if => :end_time_changed?
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :origin_lat,
                   :lng_column_name => :origin_long


  def update_cab_status
    cab = Cab.find(self.cab_id)
    cab.available_status = "booked"
    yield
    cab.save!
  end

  def calculate_traveled_charge
    traveled_time_mins = (self.end_time - self.start_time)/1.minutes
    distance_in_kms = self.distance_from([self.destination_lat,self.destination_long], :units=>:kms)
    self.amount = (distance_in_kms * 5) + traveled_time_mins
    cab = Cab.find(self.cab_id)
    cab.available_status = "available"
    self.amount += 5 if cab.color.eql?("pink")
    cab.save
  end

end
