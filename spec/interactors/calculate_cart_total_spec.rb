require 'rails_helper'

describe CalculateCartTotal do
  subject { CalculateCartTotal.call(cart_items: [ cart_item ]) }
  let(:cart_item) { create(:cart_item, quantity: 5) }

  it 'has a positive amount_with_discounts' do
    subject
    expect(subject.total).to eq(cart_item.medicine.value*5)
  end
end
