class Api::V1::Invoices::InvoiceMerchantsController < ApplicationController

  def show
    render json: Invoice.find(params[:invoice_id]).merchant
  end

end
