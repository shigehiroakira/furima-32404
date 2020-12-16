FactoryBot.define do
  factory :item do
    name              { 'test' }
    price             { 1000 }
    description       { 'aaa' }
    category_id       { 1 }
    status_id         { 1 }
    shipping_cost_id  { 1 }
    shipping_day_id   { 1 }
    prefecture_id     { 1 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
