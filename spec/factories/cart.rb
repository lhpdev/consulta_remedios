FactoryBot.define do
  factory :cart do
    association :customer, factory: :customer
    status { :active }
  end
end