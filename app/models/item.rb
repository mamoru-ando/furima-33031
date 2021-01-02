class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :delivery_days

  # validates :image, :name, :text, :price, presence: true

  # validates :prefecture_id, numericality: { other_than: 1 } 
end
