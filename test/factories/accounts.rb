FactoryBot.define do
  factory :account do
    verification_key { FactoryBot.build(:account_verification_key, account: instance) }

    to_create do |instance|
      instance.save!

      RodauthApp.rodauth.verify_account_resend(account_id: instance.id)
    end

    sequence(:email) { |n| "user#{rand(10000) + n}@example.com" }
    password { "12345678" }

    trait :admin do
      admin { true }
    end

    trait :verified do
      after(:create) do |account|
        RodauthApp.rodauth.verify_account(account_id: account.id)
      end
    end
  end
end
