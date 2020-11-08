RSpec.describe "Logging in" do
  let!(:user) { create(:user) }

  it "logs you in" do
    visit root_path
    click_on "Login"

    expect(page).to have_current_path(new_session_path)

    fill_in "Email", with: user.email
    fill_in "Password", with: "12345678"
    click_button "Login"

    expect(page).to have_current_path(posts_path)

    expect(find("nav").text).to include(user.email)
  end
end
