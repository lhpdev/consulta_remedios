class CalculateCartTotal
  include Interactor

  delegate :cart_items, to: :context

  def call
    total = cart_items.inject(0) do |sum, item| 
      sum += (item.medicine.value * item.quantity)
    end.round(4)
    context.total = total
  end
end