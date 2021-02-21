FactoryBot.define do
  factory :item do
    name               {Faker::Lorem.characters(number: 1..40)}
    info               {Faker::Lorem.characters(number: 1..1000)}
    category_id        {Faker::Number.within(range: 2..11)}
    condition_id       {Faker::Number.within(range: 2..7)}
    delivery_fee_id    {Faker::Number.within(range: 2..3)}
    delivery_source_id {Faker::Number.within(range: 2..48)}
    delivery_days_id   {Faker::Number.within(range: 2..4)}
    price              {Faker::Number.within(range: 300..9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
