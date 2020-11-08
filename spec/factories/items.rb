FactoryBot.define do
  factory :item do
    item_name {"初号機（EVA-01 TEST TYPE）"}
    description {"汎用ヒト型決戦兵器 人造人間エヴァンゲリオンの戦闘用テストタイプモデル。機体色はパープル、認識コードはEVA-01。"}
    category_id { 8 }
    condition_id { 6 }
    shipping_id { 2 }
    duration_id { 4 }
    departure_area_id { 15 }
    price { 9999999 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end