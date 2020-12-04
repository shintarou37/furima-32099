FactoryBot.define do
  factory :save do
    # association :user
    # association :item
    # association :address

    address         { "123-1234" }
    prefecture_id   { 2 }
    town            { "ルビー町"}
    post            { 1-1 }
    build           { "ルビーマンション"}
    phone           { '09012341234' }
    token            {"tok_abcdefghijk00000000000000000"}
  end
end
