FactoryGirl.define do
  factory :invoice do
    status "paid"
    merchant
    customer
    created_at "2017-05-02 13:48:30"
    updated_at "2017-05-02 13:48:30"
  end
end
