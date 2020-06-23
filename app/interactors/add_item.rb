class AddItem
  include Interactor

  delegate :medicine_id, :quantity, :cart, to: :context

  def call
    cart_item = find_or_create_item
    medicine = cart_item.medicine
    cart_item.quantity += quantity
    medicine.stock -= quantity
    ActiveRecord::Base.transaction do
      cart_item.save
      medicine.save
    end
  end

  def find_or_create_item
    item = CartItem.find_by(cart: cart, medicine_id: medicine_id)
    if item.nil?
      item = CartItem.new(cart: cart, 
                          medicine_id: medicine_id,
                          quantity: 0)
    end
    item
  end
end