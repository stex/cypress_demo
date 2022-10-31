FactoryBot.create(:account, :verified, email: "user01@example.com")
FactoryBot.create(:account, :verified, email: "user02@example.com")

Account.find_each do |account|
  FactoryBot.create_list(:post, 3, account: account)
end

Post.find_each do |post|
  Account.find_each do |account|
    next if rand(3).zero?

    FactoryBot.create(:comment, post: post, account: account)
  end
end
