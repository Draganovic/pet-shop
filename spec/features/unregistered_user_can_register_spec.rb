require 'rails_helper'

RSpec.feature "unregistered user can register" do
  scenario "they land on homepage and register" do
    # user_name1 = "Admir"
    # user_name2 = "Ted"
    # password1 = "password"
    # password2 = "secret"
    # user1 = User.new(user_name: user_name1, password: password1 )
    # user2 = User.new(user_name: user_name2, password: password2 )

    visit root_path

    expect(page).to have_link("Login")

    click_link "Create Account"
    fill_in "User name", with: "Admir"
    fill_in "Password", with: "password"
    click_button "Create Account"

    user = User.last

    expect(current_path).to eq(dashboard_path(user))
    save_and_open_page

  end
end
