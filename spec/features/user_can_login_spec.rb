require 'rails_helper'

RSpec.feature "user can login" do
  scenario "they login from homepage" do
    user_name = "Admir"
    password = "password"
    shop1_name = "Pup Stop"
    shop1_location = "123 Fake St"
    user = User.create!(user_name: user_name, password: password)
    shop1 = Shop.create!(name: shop1_name, location: shop1_location)
    puppy1 = Puppy.create!(name: "Frank", breed: "Husky", age: 2, shop_id: shop1.id, user_id: user.id)
    puppy2 = Puppy.create!(name: "Tom", breed: "Lab", age: 1, shop_id: shop1.id, user_id: user.id)
    puppy3 = Puppy.create!(name: "Becky", breed: "Poodle", age: 2, shop_id: shop1.id)

    visit root_path

    click_on "Login"

    expect(current_path).to eq login_path
    fill_in "User name", with: user.user_name
    fill_in "Password", with: password
    click_on "Login"
    expect(current_path).to eq dashboard_path


    expect(page).to have_content(user.user_name)
  end
end
