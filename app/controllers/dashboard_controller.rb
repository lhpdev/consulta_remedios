class DashboardController < ApplicationController
  include DashboardRedirect

  before_action :set_resources

  def index
    @cart_items = @cart.cart_items.includes(:medicine).order(:id)
    @stock = Medicine.where("stock > ?", 0).order(:id)
    @total = CalculateCartTotal.call(cart_items: @cart_items).total
  end

  private

  def set_resources
    if !permitted_params[:customer_id].present?
      redirect_to home_path 
    else
      @customer = Customer.find(permitted_params[:customer_id])
      @cart = @customer.active_cart.present? ? @customer.active_cart : Cart.create(customer: @customer)
    end
  end

  def permitted_params
    params.permit(:customer_id,
                  :commit, 
                  :authenticity_token)
  end
end