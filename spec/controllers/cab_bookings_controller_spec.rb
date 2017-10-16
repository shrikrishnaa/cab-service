require 'rails_helper'

RSpec.describe CabBookingsController, type: :controller do
  let(:cab) {
    create(:cab)
  }
  let(:customer) {
    create(:customer)
  }
  let(:travel_detail){
    create(:travel_detail)
  }
  describe "GET #cab_request" do
    it "returns a success response" do
      get :cab_request, params: {}
      expect(response).to be_success
    end
    it "returns a pink color car" do
      cab = Cab.create(FactoryGirl.attributes_for(:cab))
      cab.color = "pink"
      cab.save
      get :cab_request, params: {color:"pink",latitude:"12.9082",longitude:"77.6074"}, format: :json
      expect(response.body).to eq(cab.to_json)
    end
  end

  describe "POST #cab_booking" do
    it "increase the travel detail" do
      expect {
        post :cab_booking, params: {cab_booking: FactoryGirl.attributes_for(:travel_detail).merge(cab_id: cab.id,customer_id: customer.id)}
      }.to change(TravelDetail, :count).by(1)
    end
  end

  describe "PUT #start_travel" do
    it "returns a updated new value" do
        travel_detail = create(:travel_detail)
        put :start_travel, params: {cab_booking: {booking_id: travel_detail.id,origin_lat: "12.9012",origin_long: "77.6074"}}
        travel_detail.reload
        expect(travel_detail.origin_lat).to eq(12.9012)
    end
    it "renders a JSON response with the travel_detail" do
      travel_detail = create(:travel_detail)
      put :start_travel, params: {cab_booking: {booking_id: travel_detail.id,origin_lat: "12.9012",origin_long: "77.6074"}}
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "PUT #finish_travel" do
    it "returns a updated new value" do
        travel_detail = create(:travel_detail)
        travel_detail.start_time = 10.minutes.ago
        travel_detail.save
        put :finish_travel, params: {cab_booking: {booking_id: travel_detail.id,destination_lat: "11.9012",destination_long: "78.6074"}}
        travel_detail.reload
        expect(travel_detail.destination_lat).to eq(11.9012)
    end
    it "renders a JSON response with the travel_detail" do
        travel_detail = create(:travel_detail)
        travel_detail.start_time = 10.minutes.ago
        travel_detail.save
        put :finish_travel, params: {cab_booking: {booking_id: travel_detail.id,destination_lat: "11.9012",destination_long: "78.6074"}}
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
    end
  end

end
