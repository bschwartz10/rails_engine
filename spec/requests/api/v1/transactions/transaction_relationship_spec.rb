require 'rails_helper'

describe "Transaction API" do
  it "returns an invoice associated with an transaction" do
    invoice1 = create(:invoice)
    transaction1 = create(:transaction, invoice: invoice1)

    get "/api/v1/transactions/#{transaction1.id}/invoice"
    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(invoice1.id)
  end
end
