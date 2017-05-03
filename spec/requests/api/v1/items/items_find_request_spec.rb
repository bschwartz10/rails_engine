require 'rails_helper'

describe 'Items API' do
  it 'finds an item by a name' do
    item_name = create(:item).name

    get "/api/v1/items/find?name=#{item_name}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["name"]).to eq(item_name)
  end
end
