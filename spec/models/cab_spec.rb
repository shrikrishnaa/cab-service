require 'rails_helper'

RSpec.describe Cab, type: :model do
  context 'relationships' do
    it {should have_many(:travel_details)}
    it {should have_many(:customers).through(:travel_details)}
  end

  context "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:model)}
    it {should validate_presence_of(:color)}
    it {should validate_presence_of(:latitude)}
    it {should validate_presence_of(:longitude)}
    it {should validate_presence_of(:available_status)}
    it {should validate_presence_of(:number)}
  end
end
