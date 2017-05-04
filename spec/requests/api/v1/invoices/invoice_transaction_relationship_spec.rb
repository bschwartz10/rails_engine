require 'rails_helper'

describe "Invoices API" do
  it "returns a collection of associated transactions" do
    invoice1 = create(:invoice)
    create_list(:transaction, 3, invoice: invoice1)

    get "/api/v1/invoices/#{invoice1.id}/transactions"
    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice.first["result"]).to eq("success")
  end
end
