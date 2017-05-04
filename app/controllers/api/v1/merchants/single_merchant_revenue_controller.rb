class Api::V1::Merchants::SingleMerchantRevenueController < ApplicationController

  def show
    price = Merchant.find(params[:merchant_id]).revenue
    render json: { "revenue" => unit_price(price) }
  end

end
