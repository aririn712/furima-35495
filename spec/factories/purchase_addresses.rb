FactoryBot.define do
  factory :purchase_address do
    token           { 'tok_abcdefghijk00000000000000000' }
    post_code       { '123-5643' }
    area_id         { 2 }
    municipality    { 'test' }
    address         { 'test' }
    building        { 'test' }
    phone_number    { '09012345678' }
  end
end
