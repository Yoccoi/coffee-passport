FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email    {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday {Faker::Date.birthday}
  end
end
