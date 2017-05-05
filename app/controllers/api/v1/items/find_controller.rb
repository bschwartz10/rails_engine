class::Api::V1::Items::FindController < ApplicationController

  def index
    render json: Item.where(find_params)
  end

  def show
    render json: Item.order(id: :asc).find_by(find_params)
  end

private

  def find_params
    params[:unit_price] = (params[:unit_price].to_f * 100).round if params[:unit_price]
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

end
