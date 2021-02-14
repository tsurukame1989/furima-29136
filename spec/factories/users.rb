FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    first_name            {Faker::Japanese::Name.first_name}
    last_name             {Faker::Japanese::Name.last_name}
    first_name_reading    {first_name.yomi}
    last_name_reading     {last_name.yomi}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2021-12-30')}
  end
end