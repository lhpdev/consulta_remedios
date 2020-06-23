class CustomersController < ApplicationController
  include DashboardRedirect

  def index
  end

  def create
    @customer = Customer.create(name: permitted_params[:name])
    if @customer.save
      render_dashboard
    else
      flash[:alert] = "It was not possible to create a customer. Try again"
    end
  end

  def select
    @customer = Customer.find(permitted_params[:customer_id])
    flash[:notice] = "Welcome #{@customer.name.split[0]}"
    render_dashboard
  end

  private

  def permitted_params
    params.permit(:customer_id,
                  :name)
  end
end