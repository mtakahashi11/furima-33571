FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"山田"}
    first_name_katakana   {"タロウ"}
    last_name_katakana    {"ヤマダ"}
    date_of_birth         {"2000-01-01"}
  end
end