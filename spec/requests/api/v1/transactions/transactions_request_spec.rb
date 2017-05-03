require 'rails_helper'

describe 'Transactions API' do
  it "sends a list of transactions" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)
  end

  it "can get one transaction by its id" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
  end

  it "can find first instance of transaction by id" do
    id = create(:transaction).id

    get "/api/v1/transactions/find?id=#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
  end

  it "can find first instance of transaction by credit card number" do
    credit_card_number = create(:transaction).credit_card_number

    get "/api/v1/transactions/find?credit_card_number=#{credit_card_number}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["credit_card_number"]).to eq(credit_card_number)
  end

  it "can find first instance of transaction by result" do
    result = create(:transaction).result

    get "/api/v1/transactions/find?result=#{result}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["result"]).to eq(result)
  end

  it "can find first instance of transaction by created_at" do
    transaction1 = Transaction.create(credit_card_number: "5541808923795242", credit_card_expiration_date: "", result: "success", created_at: "2017-05-01 18:58:40", updated_at: "2017-05-01 19:58:40")

    get "/api/v1/transactions/find?created_at=#{"2017-05-01 18:58:40"}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(transaction1.id)
  end

  it "can find first instance of transaction by updated_at" do
    transaction1 = Transaction.create(credit_card_number: "5541808923795242", credit_card_expiration_date: "", result: "success", created_at: "2017-05-01 18:58:40", updated_at: "2017-05-01 19:58:40")

    get "/api/v1/transactions/find?updated_at=#{"2017-05-01 19:58:40"}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(transaction1.id)
  end

  it "can find all instances of transactions by id" do
    transaction1 = Transaction.create(credit_card_number: "5541808923795242", credit_card_expiration_date: "", result: "success", created_at: "2017-05-01 18:58:40", updated_at: "2017-05-01 19:58:40")
    transaction2 = Transaction.create(credit_card_number: "5541808923795243", credit_card_expiration_date: "", result: "success", created_at: "2017-05-01 18:58:40", updated_at: "2017-05-01 19:58:40")
    transaction3 = Transaction.create(credit_card_number: "5541808923795244", credit_card_expiration_date: "", result: "success", created_at: "2017-05-01 18:58:40", updated_at: "2017-05-01 19:58:40")

    get "/api/v1/transactions/find_all?id=#{transaction1.id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction.first["id"]).to eq(transaction1.id)
  end

  it "can find all instances of transactions by credit card number" do
    transaction1 = Transaction.create(credit_card_number: "5541808923795242", credit_card_expiration_date: "", result: "success", created_at: "2017-05-01 18:58:40", updated_at: "2017-05-01 19:58:40")
    transaction2 = Transaction.create(credit_card_number: "5541808923795243", credit_card_expiration_date: "", result: "success", created_at: "2017-05-01 18:58:40", updated_at: "2017-05-01 19:58:40")
    transaction3 = Transaction.create(credit_card_number: "5541808923795244", credit_card_expiration_date: "", result: "success", created_at: "2017-05-01 18:58:40", updated_at: "2017-05-01 19:58:40")

    get "/api/v1/transactions/find_all?credit_card_number=#{transaction1.credit_card_number}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction.first["credit_card_number"]).to eq(transaction1.credit_card_number)
  end

  it "can find all instances of transactions by result" do
    transaction1 = Transaction.create(credit_card_number: "5541808923795242", credit_card_expiration_date: "", result: "success", created_at: "2017-05-01 18:58:40", updated_at: "2017-05-01 19:58:40")
    transaction2 = Transaction.create(credit_card_number: "5541808923795243", credit_card_expiration_date: "", result: "success", created_at: "2017-05-01 18:58:40", updated_at: "2017-05-01 19:58:40")

    get "/api/v1/transactions/find_all?result=#{"success"}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction.first["result"]).to eq(transaction1.result)
    expect(transaction.second["result"]).to eq(transaction2.result)
  end

  it "can find all instances of transactions by created_at" do
    transaction1 = Transaction.create(credit_card_number: "5541808923795242", credit_card_expiration_date: "", result: "success", created_at: "2017-05-01 18:58:40", updated_at: "2017-05-01 19:58:40")
    transaction2 = Transaction.create(credit_card_number: "5541808923795243", credit_card_expiration_date: "", result: "success", created_at: "2017-05-01 18:58:40", updated_at: "2017-05-01 19:58:40")

    get "/api/v1/transactions/find_all?created_at=#{"2017-05-01 18:58:40"}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction.first["id"]).to eq(transaction1.id)
    expect(transaction.second["id"]).to eq(transaction2.id)
  end

  it "can find all instances of transactions by updated_at" do
    transaction1 = Transaction.create(credit_card_number: "5541808923795242", credit_card_expiration_date: "", result: "success", created_at: "2017-05-01 18:58:40", updated_at: "2017-05-01 19:58:40")
    transaction2 = Transaction.create(credit_card_number: "5541808923795243", credit_card_expiration_date: "", result: "success", created_at: "2017-05-01 18:58:40", updated_at: "2017-05-01 19:58:40")

    get "/api/v1/transactions/find_all?updated_at=#{"2017-05-01 19:58:40"}"

    transaction = JSON.parse(response.body)
    expect(response).to be_success
    expect(transaction.first["id"]).to eq(transaction1.id)
    expect(transaction.second["id"]).to eq(transaction2.id)
  end

  it "can find a random transaction" do
    transaction1 = create(:transaction)

    get "/api/v1/transactions/random"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(transaction1.id)
  end

end
