class Api::V1::ItemsMerchantsController < ApplicationController

def show
  render json: Item.find(params[:item_id]).merchant
end

end
