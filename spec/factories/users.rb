FactoryBot.define do
  factory :user do
    nickname {"碇ゲンドウ"}
    email {"gendo.ikari@nerv.com"}
    password =  Faker::Lorem.characters(number: 6)
    password { password }
    password_confirmation { password }
    first_name { "碇" }
    last_name { "ゲンドウ" }
    first_name_kana { "イカリ" }
    last_name_kana { "ゲンドウ" }
    birthday { Faker::Date.backward }  
  end
end