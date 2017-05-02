require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end

  it "can get one item by its id" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end

  it "can create a new item" do
    item_params = { name: "Your mom", description: "She's a good mom" }

    post "/api/v1/items", params: {item: item_params}
    item = Item.last

    assert_response :success
    expect(response).to be_success
    expect(item.name).to eq(item_params[:name])

  end

end
