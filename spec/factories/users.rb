FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    birthday              {"1930-01-01"}
    name                  {"花子"}
    surname               {"山田"}
    name_pseudonym        {"ハナコ"}
    surname_pseudonym     {"ヤマダ"}
  end
end