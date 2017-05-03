require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_success

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(3)
  end

  it "can get one customer by its id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end

  it "can find first instance of customer by id" do
    id = create(:customer).id

    get "/api/v1/customers/find?id=#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end

  it "can find first instance of customer by first_name" do
    first_name = create(:customer).first_name

    get "/api/v1/customers/find?first_name=#{first_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["first_name"]).to eq(first_name)
  end

  it "can find first instance of customer by last_name" do
    last_name = create(:customer).last_name

    get "/api/v1/customers/find?last_name=#{last_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["last_name"]).to eq(last_name)
  end

  it "can find first instance of customer by created at" do
    created_at = create(:customer).created_at

    get "/api/v1/customers/find?created_at=#{created_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["last_name"]).to eq("Schwartz")
  end

  it "can find first instance of customer by updated at" do
    updated_at = create(:customer).updated_at

    get "/api/v1/customers/find?updated_at=#{updated_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["last_name"]).to eq("Schwartz")
  end

  it "can find all instances of customer by id" do
    customer1 = Customer.create(first_name: "Brett", last_name: "Schwartz", created_at: "2017-05-01 19:31:07", updated_at: "2017-05-01 20:31:07")

    get "/api/v1/customers/find_all?id=#{customer1.id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer.first["id"]).to eq(customer1.id)
  end

  it "can find all instances of customer by first_name" do
    customer1 = Customer.create(first_name: "Brett", last_name: "Schwartz", created_at: "2017-05-01 19:31:07", updated_at: "2017-05-01 20:31:07")
    customer1 = Customer.create(first_name: "Brett", last_name: "Small", created_at: "2017-05-01 19:31:07", updated_at: "2017-05-01 20:31:07")

    get "/api/v1/customers/find_all?first_name=#{"Brett"}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer.first["first_name"]).to eq("Brett")
    expect(customer.second["first_name"]).to eq("Brett")
  end

  it "can find all instances of customer by last_name" do
    customer1 = Customer.create(first_name: "Brett", last_name: "Schwartz", created_at: "2017-05-01 19:31:07", updated_at: "2017-05-01 20:31:07")
    customer2 = Customer.create(first_name: "Brett", last_name: "Small", created_at: "2017-05-01 19:31:07", updated_at: "2017-05-01 20:31:07")

    get "/api/v1/customers/find_all?last_name=#{"Schwartz"}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer.first["last_name"]).to eq("Schwartz")
  end

  it "can find all instances of customer by created at" do
    customer1 = Customer.create(first_name: "Brett", last_name: "Schwartz", created_at: "2017-05-01 19:31:07", updated_at: "2017-05-01 20:31:07")
    customer2 = Customer.create(first_name: "Brett", last_name: "Small", created_at: "2017-05-01 19:31:07", updated_at: "2017-05-01 20:31:07")

    get "/api/v1/customers/find_all?created_at=#{"2017-05-01 19:31:07"}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer.first["id"]).to eq(customer1.id)
    expect(customer.second["id"]).to eq(customer2.id)
  end

  it "can find all instances of customer by updated_at at" do
    customer1 = Customer.create(first_name: "Brett", last_name: "Schwartz", created_at: "2017-05-01 19:31:07", updated_at: "2017-05-01 20:31:07")
    customer2 = Customer.create(first_name: "Brett", last_name: "Small", created_at: "2017-05-01 19:31:07", updated_at: "2017-05-01 20:31:07")

    get "/api/v1/customers/find_all?updated_at=#{"2017-05-01 20:31:07"}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer.first["id"]).to eq(customer1.id)
    expect(customer.second["id"]).to eq(customer2.id)
  end

  it "can find a random customer" do
    customer1 = create(:customer)

    get "/api/v1/customers/random"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(customer1.id)
  end

end
