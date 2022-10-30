FactoryBot.define do
  factory :account_verification_key, class: Account::VerificationKey do
    association :account

    key { SecureRandom.urlsafe_base64(32) }
    email_last_sent { 1.day.ago }
  end
end
