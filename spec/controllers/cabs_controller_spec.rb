require 'rails_helper'
RSpec.describe CabsController, type: :controller do
  let(:cab) {
    create(:cab)
  }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: cab.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Cab" do
        expect {
          post :create, params: {cab: FactoryGirl.attributes_for(:cab)}
        }.to change(Cab, :count).by(1)
      end

      it "renders a JSON response with the new cab" do

        post :create, params: {cab: FactoryGirl.attributes_for(:cab)}
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(cab_url(Cab.last))
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested cab" do
        cab = Cab.create! FactoryGirl.attributes_for(:cab)
        put :update, params: {id: cab.to_param, cab: {model: "maruthi"}}
        cab.reload
        expect(cab.model).to eq "maruthi"
      end

      it "renders a JSON response with the cab" do
        cab = Cab.create! FactoryGirl.attributes_for(:cab)
        put :update, params: {id: cab.to_param, cab: {model: "maruthi"}}
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cab" do
      cab = Cab.create! FactoryGirl.attributes_for(:cab)
      expect {
        delete :destroy, params: {id: cab.to_param}
      }.to change(Cab, :count).by(-1)
    end
  end

end
