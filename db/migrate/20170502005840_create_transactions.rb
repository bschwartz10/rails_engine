class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.string :credit_card_number
      t.string :credit_card_expiration_date
      t.string :result
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: true
    end
  end
end
