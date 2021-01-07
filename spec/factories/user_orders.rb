FactoryBot.define do
  factory :user_order do
    item_price     { 3000 }
    token           { 'tok_abcdefghijk00000000000000000' }
    postcode        { '123-4567'}
    prefecture_id   { Faker::Number.within(range: 1..47) }
    city            { '横浜市旭区' }
    block           { '二俣川1ー1ー1' }
    building        { 'ｍｍビル' }
    phone_number    { Faker::Number.leading_zero_number(digits: 11) }
    item_id        { 1 }
  end
end