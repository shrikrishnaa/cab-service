require "rails_helper"

RSpec.describe CabsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cabs").to route_to("cabs#index")
    end


    it "routes to #show" do
      expect(:get => "/cabs/1").to route_to("cabs#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/cabs").to route_to("cabs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cabs/1").to route_to("cabs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cabs/1").to route_to("cabs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cabs/1").to route_to("cabs#destroy", :id => "1")
    end

  end
end
