require 'rails_helper'

describe AddItem do
  subject { AddItem.call(medicine_id: medicine.id, cart: cart, quantity: quantity) }
  let(:cart) { create(:cart) }
  let!(:medicine) { create(:medicine) }
  let(:medicine_stock) { medicine.stock }
  let(:quantity) { 1 }

  it 'has a positive amount_with_discounts' do
    expect{ subject }.to change { CartItem.all.count }.from(0).to(1)
  end

  it 'has a positive amount_with_discounts' do
    expect{ subject }.to change { medicine.reload.stock }.from(medicine_stock).to(medicine_stock - 1)
  end
end