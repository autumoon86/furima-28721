class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :delivery_time
  belongs_to :user
  has_one_attached :image
  has_one :order
  has_one :delivery

  with_options presence: true do
    validates :name
    validates :text
    validates :category
    validates :status
    validates :delivery_fee
    validates :shipping_area
    validates :delivery_time
    validates :price, inclusion: { in: (300..9999999)}, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width number"}
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :shipping_area_id, numericality: { other_than: 1}
  validates :delivery_time_id, numericality: { other_than: 1}
end