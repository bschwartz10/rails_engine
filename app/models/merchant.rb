class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices

  def revenue(date = nil)
    if date.nil?
      invoices.joins(invoice_items: :transactions).merge(Transaction.successful).sum("quantity * unit_price")
    else
      invoices.where("created_at" => date).joins(:invoice_items).sum("quantity * unit_price")
    end
  end

end
