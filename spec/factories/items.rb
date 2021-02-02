FactoryBot.define do
  factory :item do

    name             {"商品名"}
    description      {"説明"}
    category_id      {2}
    condition_id     {2}
    delivery_fee_id  {2}
    prefecture_id    {2}
    delivery_date_id {2}
    price            {"100000"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end
  end
end
