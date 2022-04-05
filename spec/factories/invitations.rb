FactoryBot.define do
  factory :invitation do
    email { Faker::Internet.email }
    message { "Lorem Ipsium" }
    cycle_id { 2 }
    association :cycle
  end
end
