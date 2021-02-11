FactoryBot.define do
  factory :item_purchase do
    zip_code             { '123-4567' }
    prefecture_id        { 2 }
    municipality         { '横浜市' }
    street_number        { '1-1' }
    building_name        { '東京ハイツ' }
    telephone_number     { '12345678900' }
    token                { 'tok_abcdefghijk00000000000000000' }
  end
end
