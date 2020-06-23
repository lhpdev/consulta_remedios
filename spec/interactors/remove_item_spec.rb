require 'rails_helper'

describe RemoveItem do
  subject { RemoveItem.call(cart_item_id: cart_item.id, quantity: 1) }
  
  let(:medicine) { create(:medicine, stock: 3) }
  let!(:cart_item) { create(:cart_item, medicine: medicine, quantity: 1) }

  it "deletes item from cart" do
    expect { subject }.to change { CartItem.all.count }.from(1).to(0)
  end

  it "increases the item medicine stock" do
    expect { subject }.to change { medicine.reload.stock }.from(3).to(4)
  end
end
