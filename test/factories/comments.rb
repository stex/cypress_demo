FactoryBot.define do
  factory :comment do
    association :account
    association :post

    content { Faker::Lorem.sentence }
  end
end
