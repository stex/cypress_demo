FactoryBot.define do
  factory :like do
    association :liking_user, factory: :user
    association :liked_post, factory: :post
  end
end
