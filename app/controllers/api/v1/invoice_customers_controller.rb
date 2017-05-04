class Api::V1::Invoices::InvoiceCustomersController < ApplicationController

  def show
    render json: Invoice.find(params[:invoice_id]).customer
  end

end
