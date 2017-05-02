require 'csv'

namespace :import_data do

  desc "import all data"
  task all_data: [:import_merchants_csv, :import_transactions_csv, :import_customers_csv]

  desc "import merchants data"
  task :import_merchants_csv => :environment do
    CSV.foreach("db/csv/merchants.csv", headers: true, header_converters: :symbol) do |row|
      Merchant.create(
          name: row[:name],
          created_at: row[:created_at],
          updated_at: row[:updated_at]
      )
      puts "Created Merchant #{Merchant.last.id}"
    end
  end

  desc "import transactions data"
  task :import_transactions_csv => :environment do
    CSV.foreach("db/csv/transactions.csv", headers: true, header_converters: :symbol) do |row|
      Transaction.create(
        credit_card_number: row[:credit_card_number],
        result: row[:result],
        created_at: row[:created_at],
        updated_at: row[:updated_at]
      )
      puts "Created Transaction #{Transaction.last.id}"
    end
  end

  desc "import customers data"
  task :import_customers_csv => :environment do
    CSV.foreach("db/csv/customers.csv", headers: true, header_converters: :symbol) do |row|
      Customer.create(
        first_name: row[:first_name],
        last_name: row[:last_name],
        created_at: row[:created_at],
        updated_at: row[:updated_at]
      )
      puts "Created Customer #{Customer.last.first_name} #{Customer.last.last_name}"
    end


  end
end
