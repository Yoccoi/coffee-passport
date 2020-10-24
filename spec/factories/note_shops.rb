FactoryBot.define do
  factory :note_shop do
    name          { 'コーヒーブレンド' }
    rating        { '3.5' }
    comment       { Faker::Lorem.sentence }
    bitter        { '3.5' }
    acidity       { '3.5' }
    aroma         { '3.5' }
    body          { '3.5' }
    roast_date    { Faker::Date.in_date_period }
    grams         { '100' }
    price         { '2000' }
    shop_name     { 'コーヒーショップ' }
    location      { 'aaaaaaaaaaaaa0123' }
    purchase_date { Faker::Date.in_date_period }
    # association :note

    # after(:build) do |note_shop|
    #   note_shop.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end
  end
end
