require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should belong_to(:customer).class_name('Customer') }
end
