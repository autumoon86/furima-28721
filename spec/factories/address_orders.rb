FactoryBot.define do
  factory :address_order do
    postcode{"485-0033"}
    prefecture_id{2}
    city{"名古屋市"}
    block{"1-23"}
    phone_number{"09099990000"}
    token{"123abc"}
  end
end
