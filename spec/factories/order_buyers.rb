FactoryBot.define do
  Faker::Config.locale = :ja
  factory :order_buyer do
    post_code  { Faker::Address.postcode }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipalities { Faker::Address.city }
    address { Faker::Address.street_name }
    building_name { Faker::Address.building_number }
    phone_number { Faker::PhoneNumber.subscriber_number(length: 11) }
    token {"tok_abcdefghijk00000000000000000"}
  end
end