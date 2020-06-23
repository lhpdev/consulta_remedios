class Medicine < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def total
    return 0 if value.nil? || quantity.nil?
    value * quantity 
  end
end
