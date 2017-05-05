class Api::V1::MerchantMostItemsController < ApplicationController

  def index
    render json: Merchant.most_items_sold(params[:quantity])
  end

end
