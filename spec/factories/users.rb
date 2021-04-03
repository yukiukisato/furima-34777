FactoryBot.define do
    factory :user do
      nickname { Faker::Name.name }
      email { Faker::Internet.free_email }
      password { 'a1' + Faker::Internet.password(min_length: 6) }
      password_confirmation { password }
      last_name { '佐藤' }
      first_name { '次郎' }
      last_name_katakana { 'サトウ' }
      first_name_katakana { 'ジロウ' }
      birthday { '2000-01-01' }
    end
  end