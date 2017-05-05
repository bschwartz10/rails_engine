class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_sold(number)
    Item.joins(:invoice_items).merge(InvoiceItem.successful).group(:id).order("sum(quantity) DESC").limit(number)
  end

  def self.most_revenue(number)
    Item.joins(:invoice_items).merge(InvoiceItem.successful).group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price)DESC").limit(number)
  end

  def best_day
    invoices.joins(invoice_items: :transactions).merge(Transaction.successful).group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price)DESC").take
  end

end
