require 'rails_helper'

describe "Invoices API" do
  xit "returns a collection of associated items" do
    merchant1 = create(:merchant)
    customer1 = create(:customer)

    item_1, item_2 = create_list(:item, 2, merchant: merchant1)

    invoice_1 = create(:invoice, merchant: merchant1, customer: customer1)

    create(:invoice_item, invoice_id: invoice_1, item_id: item_1)
    create(:invoice_item, invoice_id: invoice_1, item_id: item_2)

    get "/api/v1/invoices/#{invoice_1.id}/items"

    expect(response).to be_success

    invoice = JSON.parse(response.body)

    expect(invoice.first["name"]).to eq("Boxer")
    expect(invoice.items.count).to eq(2)
  end
end
