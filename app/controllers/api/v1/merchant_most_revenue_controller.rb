class Api::V1::MerchantMostRevenueController < ApplicationController

  def index
    render json: Merchant.most_revenue(params[:quantity])
  end

end
