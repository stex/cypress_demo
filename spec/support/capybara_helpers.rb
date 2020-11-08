module CapybaraHelpers
  def login(user)
    visit new_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password || "12345678"
    click_button "Login"
  end
end
