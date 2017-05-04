class Api::V1::Merchants::MerchantItemsController < ApplicationController

  def show
    render json: Merchant.find(params[:merchant_id]).items
  end

end
