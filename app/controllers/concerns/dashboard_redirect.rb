module DashboardRedirect
  extend ActiveSupport::Concern

  def render_dashboard
    redirect_to dashboard_path(customer_id: @customer.id)
  end
end