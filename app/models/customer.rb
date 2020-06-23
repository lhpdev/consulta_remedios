class Customer < ApplicationRecord
  before_save :upcase_first_letter

  has_many :carts
  
  validates :name, presence: true

  def active_cart
    carts&.active.first
  end
  
  private 

  def upcase_first_letter
    self.name = self.name.titleize
  end
end
