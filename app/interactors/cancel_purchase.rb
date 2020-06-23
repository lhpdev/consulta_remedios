class CancelPurchase
  include Interactor

  delegate :cart, to: :context

  def call
    cart_items = cart.cart_items.includes(:medicine).order(:id)
    cart_items.each do |item|
      medicine = item.medicine
      medicine.stock += item.quantity
      medicine.save
      item.delete 
    end
    cart.delete
  end
end