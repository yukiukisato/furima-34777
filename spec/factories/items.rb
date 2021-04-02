FactoryBot.define do
  factory :item do
   
    name { '富士山' }
    version  {Faker::Lorem.sentence}
    category_id{4}
    status_id{2}
    shipping_fee_burden_id{3}
    delivery_area_id{4}
    delivery_day_id{5}
    price{300}
     
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
