FactoryBot.define do
  factory :item do
    product_name         { '商品名' }
    explanation          { '商品の説明' }
    price                { '301' }
    category_id          { 1 }
    product_condition_id { 1 }
    shipping_charge_id   { 1 }
    prefecture_id        { 1 }
    days_to_ship_id      { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
