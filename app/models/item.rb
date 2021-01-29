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

  with_options numericality: {other_than: 1, message: 'select'} do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :day_id
  end

  validates :price, presence: true, format: {with: /\A[0-9]+\z/}, 
  numericality: {only_integer: true, greater_than: 299, less_than: 10000000}
  
end

