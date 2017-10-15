require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'relationships' do
    it {should have_many(:travel_details)}
    it {should have_many(:cabs).through(:travel_details)}
  end

  context "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:latitude)}
    it {should validate_presence_of(:longitude)}
    it {should validate_presence_of(:email)}
  end
end
