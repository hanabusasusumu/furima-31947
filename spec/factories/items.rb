FactoryBot.define do
  factory :item do
    association :user

    name            { 'テスト' }
    message         { 'テスト' }
    category_id     { 2 }
    state_id        { 2 }
    delivery_fee_id { 2 }
    prefecture_id   { 2 }
    day_id          { 2 }
    price           { 300 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
