class::Api::V1::InvoiceItems::FindController < ApplicationController

  def index
    render json: InvoiceItem.where(find_params)
  end

  def show
    render json: InvoiceItem.find_by(find_params)
  end

private

  def find_params
    params.permit(:id, :unit_price, :quantity, :created_at, :updated_at)
  end

end
