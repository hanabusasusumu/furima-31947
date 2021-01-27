class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :day

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :message
  end

  with_options numericality: {other_than: 1} do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :day_id
  end

  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end

