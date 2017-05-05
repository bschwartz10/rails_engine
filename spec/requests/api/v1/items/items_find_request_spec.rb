require 'rails_helper'

describe 'Items API' do
  it 'finds an item by a name' do
    item_name = create(:item).name

    get "/api/v1/items/find?name=#{item_name}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["name"]).to eq(item_name)
  end

  it "can find an item by it's description" do
    item_description = create(:item).description

    get "/api/v1/items/find?description=#{item_description}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["description"]).to eq(item_description)
  end

  it "can find a random item" do
    item1 = create(:item)

    get "/api/v1/items/random"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(item1.id)
  end

end
