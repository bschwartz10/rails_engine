require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(3)
  end

  it "can get one merchant by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(id)
  end

  it "can find first instance of merchant by id" do
    id = create(:merchant).id

    get "/api/v1/merchants/find?id=#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(id)
  end

  it "can find first instance of merchant by name" do
    name = create(:merchant).name

    get "/api/v1/merchants/find?name=#{name}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq(name)
  end

  it "can find first instance of merchant by created_at" do
    name = Merchant.create(name: "Turing", created_at: "2017-05-01 18:07:51", updated_at: "2017-05-01 19:07:51").name

    get "/api/v1/merchants/find?created_at=#{"2017-05-01 18:07:51"}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq(name)
  end

  it "can find first instance of merchant by updated_at" do
    name = Merchant.create(name: "Turing", created_at: "2017-05-01 18:07:51", updated_at: "2017-05-01 19:07:51").name

    get "/api/v1/merchants/find?updated_at=#{"2017-05-01 19:07:51"}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq(name)
  end

  it "can find all instances of merchants by id" do
    merchant1 = Merchant.create(name: "Turing", created_at: "2017-05-01 18:07:51", updated_at: "2017-05-01 19:07:51")
    merchant2 = Merchant.create(name: "Chipotle", created_at: "2017-05-01 18:07:51", updated_at: "2017-05-01 19:07:51")
    merchant3 = Merchant.create(name: "Panera", created_at: "2017-05-01 18:07:51", updated_at: "2017-05-01 19:07:51")

    get "/api/v1/merchants/find_all?id=#{merchant1.id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant.first["id"]).to eq(merchant1.id)
  end

  it "can find all instances of merchants by name" do
    merchant1 = Merchant.create(name: "Chipotle", created_at: "2017-05-01 18:07:51", updated_at: "2017-05-01 19:07:51")
    merchant2 = Merchant.create(name: "Chipotle", created_at: "2017-05-01 18:07:51", updated_at: "2017-05-01 19:07:51")

    get "/api/v1/merchants/find_all?name=#{merchant2.name}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant.first["name"]).to eq(merchant1.name)
    expect(merchant.second["name"]).to eq(merchant2.name)
  end

  it "can find all instances of merchants by created_at" do
    merchant1 = Merchant.create(name: "Chipotle", created_at: "2017-05-01 18:07:51", updated_at: "2017-05-01 19:07:51")
    merchant2 = Merchant.create(name: "Chipotle", created_at: "2017-05-01 18:07:51", updated_at: "2017-05-01 19:07:51")

    get "/api/v1/merchants/find_all?created_at=#{"2017-05-01 18:07:51"}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant.first["name"]).to eq(merchant1.name)
    expect(merchant.second["name"]).to eq(merchant2.name)
  end

  it "can find all instances of merchants by updated_at" do
    merchant1 = Merchant.create(name: "Chipotle", created_at: "2017-05-01 18:07:51", updated_at: "2017-05-01 19:07:51")
    merchant2 = Merchant.create(name: "Chipotle", created_at: "2017-05-01 18:07:51", updated_at: "2017-05-01 19:07:51")

    get "/api/v1/merchants/find_all?updated_at=#{"2017-05-01 19:07:51"}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant.first["name"]).to eq(merchant1.name)
    expect(merchant.second["name"]).to eq(merchant2.name)
  end

  it "can find a random merchant" do
    merchant1 = create(:merchant)

    get "/api/v1/merchants/random"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(merchant1.id)
  end
end
