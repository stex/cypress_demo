FactoryBot.define do
  factory :post do
    association :account

    title { Faker::Lorem.words(number: rand(1..4)).join(" ") }
    content { Faker::Lorem.paragraphs(number: rand(4..10)).join("\n") }
  end
end
