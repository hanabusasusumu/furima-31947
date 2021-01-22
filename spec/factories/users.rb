FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '000aaa' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_furigana    { 'ヤマダ' }
    first_name_furigana   { 'タロウ' }
    birthday              { '1930-1-1' }
  end
end
