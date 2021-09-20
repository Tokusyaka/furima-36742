FactoryBot.define do
  factory :item do
    explanation { 'テスト説明' }
    category_id { 2 }
    status_id { 2 }
    postage_id { 2 }
    prefecture_id { 2 }
    delivery_days_id { 2 }
    price { 1000 }
    product { 'サンプル商品' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
