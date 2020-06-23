class CartItemsController < ApplicationController
  include DashboardRedirect

  skip_before_action :verify_authenticity_token
  before_action :set_resources

  def add
    if !params[:quantity].present? 
      flash[:alert] =  "To add an item you need to inform the quantity"
    else
      AddItem.call(cart: @cart, 
                  medicine_id: permitted_params[:medicine_id], 
                  quantity: permitted_params[:quantity].to_i)
      flash[:notice] = "Item added succesfully" 
    end
    render_dashboard
  end

  def remove
    if !params[:quantity].present? 
      flash[:alert] = "To remove an item you need to inform the quantity"
    else
      RemoveItem.call(cart_item_id: permitted_params[:cart_item_id], 
                      quantity: permitted_params[:quantity].to_i)
      flash[:notice] = "Item removed succesfully"
    end
    render_dashboard
  end

  private

  def set_resources
    @cart = Cart.find(permitted_params[:cart_id])
    @customer = @cart.customer
  end

  def permitted_params
    params.permit(:quantity,
                  :cart_id,
                  :cart_item_id,
                  :medicine_id)
  end
end