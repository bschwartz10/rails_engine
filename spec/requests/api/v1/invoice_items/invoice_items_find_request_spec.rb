require 'rails_helper'

# Quantity unit price

describe "Invoice items API" do
  it "finds an invoice item by a quantity" do
    invoice_item_quantity = create(:invoice_item).quantity

    get "/api/v1/invoice_items/find?quantity=#{invoice_item_quantity}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["quantity"]).to eq(invoice_item_quantity)
  end

  it "finds an invoice item by a unit_price" do
    invoice_item_price = create(:invoice_item).unit_price

    get "/api/v1/invoice_items/find?unit_price=#{invoice_item_price}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["unit_price"]).to eq("123.45")
  end

end
