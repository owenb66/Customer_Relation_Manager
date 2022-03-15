class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  # Add new actions according on routers.
  def index_1
    @customers = Customer.all.order(:full_name)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def missing_email
    @customers = Customer.where(email_address: [nil, ""])
  end
end
