# require 'rails_helper'
#
# describe "Invoices API" do
#   it "returns a collection of associated items" do
#     invoice1 = create(:invoice)
#     create_list(:item, 3, invoice: invoice1)
#
#     get "/api/v1/invoices/#{invoice1.id}/items"
#     expect(response).to be_success
#
#     invoice = JSON.parse(response.body)
#     expect(invoice.first["name"]).to eq("Boxer")
#   end
# end
