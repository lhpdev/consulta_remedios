require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe "POST complete" do
    let!(:cart) { create(:cart) }

    subject { 
      post :complete, params: { customer_id: cart.customer.id, cart_id: cart.id } 
    }

    it "changes cart status" do
      expect { subject }.to change { cart.reload.status }.from("active").to("completed")
    end

    it "gets correct flash message" do
      expect(subject.request.flash[:notice]).to match(/Cart purchased succesfully*/)
    end
  end

  describe "POST cancel" do
    let!(:cart_item) { create(:cart_item) }
    subject { 
      post :cancel, params: { customer_id: cart_item.cart.customer.id } 
    }

    it "deletes all cart items" do
      expect { subject }.to change { CartItem.count }.from(1).to(0)
    end

    it "deletes customer cart" do
      expect { subject }.to change { Cart.count }.from(1).to(0)
    end

    it "gets correct flash message" do
      expect(subject.request.flash[:notice]).to match(/Cart discarted succesfully*/)
    end
  end
end