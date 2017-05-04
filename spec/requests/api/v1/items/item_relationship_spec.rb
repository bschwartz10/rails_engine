require 'rails_helper'

describe "Item API" do
  it "returns invoice items associated with an item" do
    item1 = create(:item)
    create_list(:invoice_item, 3, item: item1)

    get "/api/v1/items/#{item1.id}/invoices"
    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice.first["id"]).to eq(12)
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
