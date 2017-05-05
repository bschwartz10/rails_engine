class ApplicationController < ActionController::API

  def unit_price(price)
    floated = price.to_f / 100
    sprintf("%.2f", floated)
  end


end
