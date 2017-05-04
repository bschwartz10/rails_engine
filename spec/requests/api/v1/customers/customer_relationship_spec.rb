require 'rails_helper'

describe "Customer API" do
  it "returns invoices associated with a customer" do
    merchant1 = create(:merchant)
    customer1 = create(:customer)
    invoice1 = create(:invoice, merchant: merchant1, customer: customer1)

    get "/api/v1/customers/#{customer1.id}/invoices"
    expect(response).to be_success

    invoices = JSON.parse(response.body)
    expect(invoices.first["id"]).to eq(invoice1.id)
  end

  it "returns transactions associated with a customer" do
    merchant1 = create(:merchant)
    customer1 = create(:customer)
    invoice1 = create(:invoice, merchant: merchant1, customer: customer1)
    transaction1 = create(:transaction, invoice: invoice1)

    get "/api/v1/customers/#{customer1.id}/transactions"
    expect(response).to be_success

    transactions = JSON.parse(response.body)
    expect(transactions.first["id"]).to eq(transaction1.id)
  end
end
