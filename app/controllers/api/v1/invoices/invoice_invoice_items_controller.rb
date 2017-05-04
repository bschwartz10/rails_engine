class Api::V1::Invoices::InvoiceInvoiceItemsController < ApplicationController

  def show
    render json: Invoice.find(params[:invoice_id]).invoice_items
  end

end
