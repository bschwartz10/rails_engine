class Api::V1::Merchants::SingleMerchantFavoriteCustomerController < ApplicationController

  def show
    render json: Merchant.find(params[:merchant_id]).favorite_customer
  end

end
