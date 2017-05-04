require 'rails_helper'

describe "Invoices API" do
  it "returns a collection of associated customers" do
    customer1 = create(:customer)
    invoice1 = create(:invoice, customer: customer1)

    get "/api/v1/invoices/#{invoice1.id}/customer"
    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice["first_name"]).to eq("Brett")
  end
end
