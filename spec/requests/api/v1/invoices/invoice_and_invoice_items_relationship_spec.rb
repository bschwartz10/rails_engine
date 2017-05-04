require 'rails_helper'

describe "Invoices API" do
  it "returns a collection of associated invoice items" do
    invoice1 = create(:invoice)
    create_list(:invoice_item, 3, invoice: invoice1)

    get "/api/v1/invoices/#{invoice1.id}/invoice_items"
    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice.first["unit_price"]).to eq("123.45")
  end
end
