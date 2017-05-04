class Api::V1::Merchants::SingleMerchantRevenueController < ApplicationController

  def show
    require "pry"; binding.pry
    render json: Merchant.find(params[:merchant_id]).revenue
  end

end
