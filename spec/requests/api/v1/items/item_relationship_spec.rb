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

  it "returns an merchant associated with an item" do
    merchant1 = create(:merchant)
    item1 = create(:item, merchant: merchant1)

    get "/api/v1/items/#{item1.id}/merchant"
    expect(response).to be_success

    merchant = JSON.parse(response.body)
    expect(merchant["id"]).to eq(merchant1.id)
  end
end
