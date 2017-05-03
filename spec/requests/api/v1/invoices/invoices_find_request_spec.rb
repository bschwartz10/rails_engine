require 'rails_helper'

describe "invoices API" do
  it "finds an ivoice by a status" do
    invoice_status = create(:invoice).status

    get "/api/v1/invoices/find?status=#{invoice_status}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["status"]).to eq(invoice_status)
  end
end
