require 'rails_helper'

RSpec.feature "current user can purchase a dog" do
  scenario "they add a dog to cart and checkout" do
    pending
    shop1_name = "Pup Stop"
    shop1_location = "123 Fake St"
    user_name = "Admir"
    password = "password"
    user = User.create!(user_name: user_name, password: password )
    shop1 = Shop.create!(name: shop1_name, location: shop1_location)
    puppy1 = Puppy.create!(name: "Frank", breed: "Husky", age: 2, shop_id: shop1.id, user_id: user.id)
    puppy2 = Puppy.create!(name: "Tom", breed: "Lab", age: 1, shop_id: shop1.id)
    puppy3 = Puppy.create!(name: "Becky", breed: "Poodle", age: 2, shop_id: shop1.id)


    visit shop_puppies_path(shop1)

    within "#puppy-#{puppy2.id}" do
      click_on "Add to cart"
    end

    click_on "Checkout"

    expect(current_path).to eq user_cart_path(user)
    expect(page).to have_content puppy2.name
    expect(page).to_not have_content puppy1.name
    expect(page).to_not have_content puppy3.name

    click_on "Buy Puppy"

    expect(current_path).to eq user_dashboard_path(user)
    expect(page).to have_content puppy2.name
    expect(page).to have_content puppy1.name
    expect(page).to_not have_content puppy3.name
    expect(user.puppies).to include puppy2
    expect(user.puppies).to include puppy1
  end
end
