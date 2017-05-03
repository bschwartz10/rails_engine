require 'rails_helper'

RSpec.describe Item, type: :model do
  context "relationships" do
    it "belongs to a merchant" do
      item = Item.create(name: "Soap", description: "Use it so you dont smell", unit_price: 1, merchant_id: 1, created_at: "2017-05-01 19:31:07", updated_at: "2017-05-01 19:31:07")
        expect(item).to respond_to(:merchant)
    end
  end
end
