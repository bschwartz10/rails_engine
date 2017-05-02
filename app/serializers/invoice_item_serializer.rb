class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :quantity, :unit_price
end
