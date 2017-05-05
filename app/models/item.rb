class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

def self.most_sold(number)
  Item.joins(:invoice_items).merge(InvoiceItem.successful).group(:id).order("sum(quantity) DESC").limit(number)
end


end
