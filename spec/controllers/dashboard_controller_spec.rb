require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe "GET index" do
    let(:customer) { create(:customer) }

    it "redirects to home path" do
      get :index
      expect(subject).to redirect_to("/")
    end

    it "has a 200 status code" do
      get :index, params: { customer_id: customer.id }
      expect(response.status).to eq(200) 
    end
  end
end
