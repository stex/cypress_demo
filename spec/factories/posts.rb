FactoryBot.define do
  factory :post do
    association :author, factory: :user

    title { Faker::Movie.quote }
    body { Faker::Lorem.paragraphs(number: rand(3..6)).map { |p| "<p>#{p}</p>" }.join }
  end
end
