class Api::V1::CustomersInvoicesController < ApplicationController

  def show
    render json: Customer.find(params[:customer_id]).invoices
  end


end
