class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices

  def revenue
    invoices.join(invoice_items: :transactions).merge(Transaction.successful).sum("quantity * unit_price")
  end

  def revenue_by_date(date)
    invoices.where("created_at" => date).joins(:invoice_items).sum("quantity * unit_price")
  end

end
