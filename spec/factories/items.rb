FactoryBot.define do
  factory :item do
    title        { 'test' }
    description  { 'test' }
    category_id  { 2 }
    status_id    { 2 }
    bearer_id    { 2 }
    area_id      { 2 }
    number_id    { 2 }
    price        { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
