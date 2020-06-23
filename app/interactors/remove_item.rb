class RemoveItem
  include Interactor

  delegate :cart_item_id, :quantity, to: :context

  def call
    cart_item = CartItem.includes(:medicine).find(cart_item_id)
    medicine = cart_item.medicine
    cart_item.quantity -= quantity
    medicine.stock += quantity
    if cart_item.quantity < 1
      ActiveRecord::Base.transaction do
        cart_item.delete
        medicine.save
      end
    else
      ActiveRecord::Base.transaction do
        cart_item.save
        medicine.save
      end
    end
  end
end