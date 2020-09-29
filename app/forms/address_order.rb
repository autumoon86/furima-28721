class AddressOrder
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token, :exhibition_id

  with_options presence: true do
    validates :postcode, format:{ with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'include hyphen(-)'}, length: { maximum: 8 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'is not include hyphen(-)'}, length: { maximum: 11 }
    validates :city, :block, :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create!(item_id: item_id, postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id )
  end
end