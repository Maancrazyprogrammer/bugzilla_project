# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { "nouman123" }
    role { %w[developer manager QA].sample }
    name { "nouman" }
  end
end
