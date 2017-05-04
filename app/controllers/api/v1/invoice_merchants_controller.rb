class Api::V1::InvoiceMerchantsController < ApplicationController

  def show
    render json: Invoice.find(params[:invoice_id]).merchant
  end

end
