require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe "GET index" do
    subject { 
      get :index 
    }

    it "has a 200 status code" do
      expect(subject.status).to eq(200) 
    end
  end

  describe "POST create" do 
    context 'with all params' do
      subject { 
        post :create, params: { name: 'Name' } 
      }

      it "has a 302 status code" do
        expect(subject.status).to eq(302) 
      end

      it "creates a new user" do
        expect { subject }.to change { Customer.count }.from(0).to(1)
      end
    end

    context 'missing name param' do
      subject { 
        post :create, params: { name: "" } 
      }

      it "has a 302 status code" do
        expect(subject.status).to eq(204) 
      end

      it "creates a new user" do
        expect { subject }.to_not change { Customer.count }
      end
    end
  end

  describe "POST select" do
    let(:customer) { create(:customer) }

    subject { 
      post :select, params: { customer_id: customer.id } 
    }

    it "has a 302 status code" do
      expect(subject.status).to eq(302) 
    end
  end
end