require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'validations' do
    let(:invalid_attributes) { { name: nil } }
    let(:valid_attributes) { { name: 'custumer name'} }

    it 'is an invalid instance' do
      invalid_customer =  Customer.new(invalid_attributes)
      expect(invalid_customer).to be_invalid
    end

    it 'is a valid instance' do
      valid_customer =  Customer.new(valid_attributes)
      expect(valid_customer).to be_valid
    end
  end

  context '#upcase_first_letter' do
    let(:valid_attributes) { { name: 'custumer name' } }
    subject { Customer.create(valid_attributes) }

    it 'titleize customer name' do
      expect(subject.name).to eq('Custumer Name')
    end
  end

  describe '#active_cart' do
    let(:customer) { create(:customer) }

    it 'does not return active cart' do
      expect(customer.active_cart).to be_nil
    end

    it 'does not return active cart' do
      cart = Cart.create(customer: customer)
      expect(customer.active_cart).to eq(cart)
    end
  end
end
