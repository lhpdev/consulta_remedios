class CartsController < ApplicationController
  include DashboardRedirect
  
  skip_before_action :verify_authenticity_token
  before_action :set_resources
  
  def complete
    complete_purchase
    flash[:notice] = "Cart purchased succesfully"
    render_dashboard
  end

  def cancel
    CancelPurchase.call(cart: @cart)
    flash[:notice] = "Cart discarted succesfully"
    render_dashboard
  end

  private

  def complete_purchase
    @cart.completed!
  end

  def set_resources
    @customer = Customer.find(permitted_params[:customer_id])
    @cart = @customer.active_cart
  end

  def permitted_params
    params.permit(:customer_id)
  end
end