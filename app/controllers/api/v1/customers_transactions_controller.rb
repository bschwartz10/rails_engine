class Api::V1::CustomersTransactionsController < ApplicationController

def show
  render json: Customer.find(params[:customer_id]).transactions
end

end
