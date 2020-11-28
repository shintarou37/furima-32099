FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             {'あ'}
    first_name            {'あ'}
    first_name_kana       {'ア'}
    last_name_kana        {'ア'}
    birthday              {"1990-01-01"}
  end
end
