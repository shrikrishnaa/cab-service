class Customer < ApplicationRecord
  validates :name,:model,:latitude,:longitude presence:true
  validates :email, presence:true, uniqueness: {case_sensitive: false }
  has_many :travel_details
  has_many :cabs, through: :travel_details
end
