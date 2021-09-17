FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { 'sample@test.com' }
    password { '111aaa' }
    password_confirmation { '111aaa' }
    first_name { '高橋' }
    last_name { '加奈子' }
    first_name_kana { 'タカハシ' }
    last_name_kana { 'カナコ' }
    birthday { '1990-09-09' }
  end
end
