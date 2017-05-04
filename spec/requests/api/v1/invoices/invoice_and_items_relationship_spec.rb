require 'rails_helper'

describe "Invoices API" do
  it "returns a collection of associated items" do
    item_1, item_2 = create_list(:item, 2)

    invoice_1 = create(:invoice)

    create(:invoice_item, invoice: invoice_1, item_id: item_1.id)
    create(:invoice_item, invoice: invoice_1, item_id: item_2.id)

    get "/api/v1/invoices/#{invoice_1.id}/items"

    expect(response).to be_success

    invoice = JSON.parse(response.body)

    expect(invoice.first["name"]).to eq("Boxer")
    expect(invoice.count).to eq(1)
  end
end
