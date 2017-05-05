class Api::V1::MostItemsController < ApplicationController

  def index
    render json: Item.most_sold(params[:quantity])
  end

end
