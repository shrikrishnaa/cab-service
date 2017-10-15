class Cab < ApplicationRecord
  enum available_status: [:available, :booked, :unavailable]
  validates :name,:model,:color,:latitude,:longitude,:available_status, presence:true
  validates :number, presence:true, uniqueness: {case_sensitive: false }
  has_many :travel_details
  has_many :customers,through: :travel_details
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
end
