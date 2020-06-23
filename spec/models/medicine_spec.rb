require 'rails_helper'

RSpec.describe Medicine, type: :model do
  context 'when all medicine attributes are valid' do
    let(:valid_attributes) { { name: 'Aspirina', value: 10.0, quantity: 1, stock: 10 } }
    subject { Medicine.new(valid_attributes) }

    it 'multiplies' do
      expect(subject.total).to eql 10.0
    end
  end
  
  context 'when value or quantity is null' do
    let(:invalid_attributes) { { name: 'Aspirina', value: nil, quantity: 1, stock: 10 } }
    subject { Medicine.new(invalid_attributes) }
    
    it 'returns 0' do
      expect(subject.total).to eql 0
    end
  end
end
