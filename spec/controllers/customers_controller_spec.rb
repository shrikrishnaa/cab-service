require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  let(:customer) {
    create(:customer)
  }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: customer.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Customer" do
        expect {
          post :create, params: {customer: FactoryGirl.attributes_for(:customer)}
        }.to change(Customer, :count).by(1)
      end

      it "renders a JSON response with the new customer" do

        post :create, params: {customer: FactoryGirl.attributes_for(:customer)}
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(customer_url(Customer.last))
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested customer" do
        put :update, params: {id: customer.to_param, customer: {name: "Ram"}}
        customer.reload
        expect(customer.name).to eq "Ram"
      end
      it "renders a JSON response with the customer" do
        put :update, params: {id: customer.to_param, customer: {name: "Ram"}}
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested customer" do
      customer = Customer.create! FactoryGirl.attributes_for(:customer)
      expect {
        delete :destroy, params: {id: customer.to_param}
      }.to change(Customer, :count).by(-1)
    end
  end

end
