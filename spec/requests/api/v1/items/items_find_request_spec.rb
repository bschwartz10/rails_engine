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

  it "can find an item by it's unit_price" do
    item_price = create(:item).unit_price

    get "/api/v1/items/find?unit_price=#{item_price}"

    item = JSON.parse(response.body)
    expect(response).to be_success
    expect(item["unit_price"]).to eq("123.45")
  end

  # it "can find an item by date created" do
  #   created = "2017-01-01T00:00:00.000Z"
  #
  #   created_at_date = create(:item, created_at: created)
  #
  #   get "/api/v1/items/find?created_at=#{created}"
  #
  #   item = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(item["created_at"]).to eq(created)
  # end

  it "can find a random item" do
    item1 = create(:item)

    get "/api/v1/items/random"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(item1.id)
  end

end
