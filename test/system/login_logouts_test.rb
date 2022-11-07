require "application_system_test_case"

class LoginLogoutsTest < ApplicationSystemTestCase
  setup do
    @account = FactoryBot.create(:account, :verified)
  end

  test "visiting the index" do
    visit "/login"

    page.find("input[name=login]").fill_in(with: @account.email)
    page.find("input[name=password]").fill_in(with: @account.password)
    click_button "Login"

    page.find("#navbarNav", text: "Logout")

    click_button "Logout"

    page.find("#navbarNav", text: "Login")
  end
end
