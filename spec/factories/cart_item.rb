FactoryBot.define do
  factory :cart_item do
    association :cart, factory: :cart
    association :medicine, factory: :medicine
    quantity { 1 }
  end
end