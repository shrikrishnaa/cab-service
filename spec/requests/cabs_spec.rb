require 'rails_helper'

RSpec.describe "Cabs", type: :request do
  describe "GET /cabs" do
    it "works! (now write some real specs)" do
      get cabs_path
      expect(response).to have_http_status(200)
    end
  end
end
