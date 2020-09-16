class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :delivery_time
  
  with_options presence: true do
    validates :name
    validates :text
    validates :category
    validates :status
    validates :delivery_fee
    validates :shipping_area
    validates :delivery_time
    validates :price
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :shipping_area, numericality: { other_than: 1}
  validates :delivery_time, numericality: { other_than: 1}
end