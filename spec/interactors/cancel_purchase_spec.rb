require 'rails_helper'

describe CancelPurchase do
  subject { CancelPurchase.call(cart: cart) }

  let(:cart) { create(:cart) }
  let!(:cart_item) { create(:cart_item, cart: cart) }

  it "deletes all cart items" do
    expect { subject }.to change { CartItem.count }.from(1).to(0)
  end

  it "deletes customer cart" do
    expect { subject }.to change { Cart.count }.from(1).to(0)
  end
end
