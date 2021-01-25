class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :prefecture

  belongs_to :user
  has_one_attached :image

  validates :category_id, numericality: {other_than: 1}
  validates :state_id, numericality: {other_than: 1}
  validates :delivery_fee_id, numericality: {other_than: 1}
  validates :prefecture_id, numericality: {other_than: 1}

end
