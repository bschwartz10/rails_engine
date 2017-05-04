require 'rails_helper'

describe "Merchants API" do
  it "returns a collection of invoices associated with that merchant from their known orders" do
    merchant1 = create(:merchant)
    create_list(:invoice, 3, merchant: merchant1)

    get "/api/v1/merchants/#{merchant1.id}/invoices"

    expect(response).to be_success

    merchant = JSON.parse(response.body)
    expect(merchant.first["status"]).to eq("paid")
  end
end
