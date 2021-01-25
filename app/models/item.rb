class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :user
  has_one_attached :image

  validates :category_id, numericalety: {other_than: 1}
  validates :state_id, numericalety: {other_than: 1}

end
