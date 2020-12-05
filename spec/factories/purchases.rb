FactoryBot.define do
  factory :purchase do
    # association :user
    # association :item
    address         { '123-1234' }
    prefecture_id   { 2 }
    town            { 'ルビー町' }
    post            { 1 - 1 }
    build           { 'ルビーマンション' }
    phone           { '09012341234' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id         { 1 }
    item_id         { 1 }
  end
end
