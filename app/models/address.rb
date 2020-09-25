class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :order, optional: true
  belongs_to :item

  with_options presence: true do
    validates :postcode
    validates :prefecture
    validates :city
    validates :block
    validates :phone_number
  end
 
  validates :prefecture_id, numericality: { other_than: 1 }
end
