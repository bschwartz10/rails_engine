class::Api::V1::Items:FindController < ApplicationController

  def index
    render json: Item.where(find_params)
  end


  def show

  end


private

  def find_params
    params.permit(:name, :id, :description, :unit_price, :created_at, :updated_at)
  end

end
