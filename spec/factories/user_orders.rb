FactoryBot.define do
  factory :user_order do

    postal_code   { '111-1111' }
    prefecture_id { 2 }
    city          { '横浜市緑区' }
    house_number  { '青山1-1' }
    building      {''}
    phone_number  { '09012345678' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
