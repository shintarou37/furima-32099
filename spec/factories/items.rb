FactoryBot.define do
  factory :item do
    association :user
    name            { Faker::Name.initials(number: 2) }
    explanation     { 'これは私の出品した商品です' }
    price           { Faker::Number.number(digits: 4) }
    category_id     { 2 }
    status_id       { 2 }
    delivery_fee_id { 2 }
    day_id          { 2 }
    prefecture_id   { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
