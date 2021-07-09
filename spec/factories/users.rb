FactoryBot.define do
  factory :user do
    nickname              { Faker::Name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    birthday              { Faker::Date.between(from: '1930-01-01', to: 5.years.ago) }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    last_kana             { Gimei.last.katakana }
    first_kana            { Gimei.first.katakana }
  end
end
