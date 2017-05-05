class Api::V1::MerchantsRevenueByDateController < ApplicationController

  def index
    render json: { "total_revenue" => unit_price(Merchant.date_revenue(params[:date])) }
  end

end
