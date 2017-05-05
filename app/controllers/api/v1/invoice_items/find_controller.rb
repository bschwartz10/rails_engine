class::Api::V1::InvoiceItems::FindController < ApplicationController

  def index
    render json: InvoiceItem.where(find_params)
  end

  def show
    render json: InvoiceItem.find_by(find_params)
  end

private

  def find_params
    params[:unit_price] = (params[:unit_price].to_f * 100).round if params[:unit_price]    
    params.permit(:id, :unit_price, :invoice_id, :item_id, :quantity, :created_at, :updated_at)
  end

end
