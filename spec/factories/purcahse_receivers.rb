FactoryBot.define do
  factory :purchase_receiver do
    zip_code {"150-8001"}
    departure_area_id  {14}
    address {"渋谷区神南2丁目"}
    street_number {"2-1"}
    building_name {"NHK放送センター"}
    phone_number {"0000000000"}
    token {'token'}
  end
end