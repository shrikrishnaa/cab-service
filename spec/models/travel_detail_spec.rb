require 'rails_helper'

RSpec.describe TravelDetail, type: :model do
  context 'relationships' do
    it {should belong_to(:cab)}
    it {should belong_to(:customer)}
  end

end
