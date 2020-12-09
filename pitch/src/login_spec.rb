RSpec.describe "Logging in" do
  let!(:user) { FactoryBot.create(:user) }

  it "logs you in" do
    visit root_path
    click_on "Login"

    fill_in "Email", with: user.email
    fill_in "Password", with: "12345678"
    click_button "Login"

    expect(find("nav").text).to include(user.email)
  end
end
