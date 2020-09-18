FactoryBot.define do
  factory :item do
    name{"iPhone11"}
    text{"未使用です"}
    category_id{2}
    status_id{2}
    delivery_fee_id{2}
    shipping_area_id{2}
    delivery_time_id{2}
    price{"9999"}
    
    association :user
  end
end
