class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{,11}\z/, message: 'is invalid' }
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'select' }

  def save
    buy_record = BuyRecord.create(user_id: user_id, item_id: item_id)
    UserAddress.create(
      postal_code: postal_code, prefecture_id: prefecture_id,
      city: city, house_number: house_number, building: building,
      phone_number: phone_number, buy_record_id: buy_record.id
    )
  end
end
