require 'rails_helper'

describe "Invoices API" do
  it "returns the associated merchant" do
    merchant1 = create(:merchant)
    invoice1 = create(:invoice, merchant: merchant1)

    get "/api/v1/invoices/#{invoice1.id}/merchant"
    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(merchant1.id)
  end
end
