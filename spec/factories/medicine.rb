FactoryBot.define do
  factory :medicine do
    sequence(:name) { |n| "Medicine #{n}" }
    value { 6.5 }
    stock { 20 }
  end
end