require 'rails_helper'

describe "Invoice Item API" do
  it "returns an invoice associated with an invoice item" do
    invoice1 = create(:invoice)
    invoice_item1 = create(:invoice_item, invoice: invoice1)

    get "/api/v1/invoice_items/#{invoice_item1.id}/invoice"
    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(invoice1.id)
  end

  it "returns an item associated with an invoice item" do
    item1 = create(:item)
    invoice_item1 = create(:invoice_item, item: item1)

    get "/api/v1/invoice_items/#{invoice_item1.id}/item"
    expect(response).to be_success

    item = JSON.parse(response.body)
    expect(item["id"]).to eq(item1.id)
  end
end
