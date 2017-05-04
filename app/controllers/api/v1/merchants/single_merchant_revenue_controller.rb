class Api::V1::Merchants::SingleMerchantRevenueController < ApplicationController

  def show
    render json: { "revenue" => unit_price(Merchant.find(params[:merchant_id]).revenue(params[:date])) }
  end

end
