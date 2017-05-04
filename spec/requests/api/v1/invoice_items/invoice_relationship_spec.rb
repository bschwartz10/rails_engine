require 'rails_helper'

describe "Invoice Item API" do
  it "returns a collection of invoices associated with an invoice item" do
    invoice1 = create(:invoice)
    invoice_item1 = create(:invoice_item, invoice: invoice1)

    get "/api/v1/invoice_items/#{invoice_item1.id}/invoice"
    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(invoice1.id)
  end
end
