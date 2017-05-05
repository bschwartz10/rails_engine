class Api::V1::Items::ItemsBestDayController < ApplicationController

  def show
    render json: Item.find(params[:item_id]).best_day, serializer: :: DateSerializer
  end

end
