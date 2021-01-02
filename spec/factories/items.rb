FactoryBot.define do
  factory :item do
    name              {"商品名"}
    text              {"商品説明"}
    category_id       {Faker::Number.within(range: 1..10)}
    status_id         {Faker::Number.within(range: 1..6)}
    delivery_id       {Faker::Number.within(range: 1..2)}
    prefecture_id     {Faker::Number.within(range: 1..47)}
    delivery_days_id  {Faker::Number.within(range: 1..3)}
    price             {1000} 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
