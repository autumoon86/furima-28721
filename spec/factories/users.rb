FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    birthday              {"1997-04-11"}
    first_name            {"太郎"}
    family_name           {"阿部"}
    first_name_kana       {"タロウ"}
    family_name_kana      {"アベ"}
  end
end