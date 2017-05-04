require 'rails_helper'

describe "Merchants API" do
  it "returns a collection of items associated with merchant" do
    merchant1 = create(:merchant)
    create_list(:item, 3, merchant: merchant1)

    get "/api/v1/merchants/#{merchant1.id}/items"
    expect(response).to be_success

    item = JSON.parse(response.body)
    expect(item.first["name"]).to eq("Boxer")
  end
end
