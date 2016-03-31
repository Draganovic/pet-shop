require 'rails_helper'

RSpec.feature "user can visit a shops page" do
  scenario "they go to the shops index and see a specific shop" do
    shop1_name = "Pup Stop"
    shop2_name = "The Mill"
    shop1_location = "123 Fake St"
    shop2_location = "222 Made-up Ave"


    shop1 = Shop.create(name: shop1_name, location: shop1_location)
    shop2 = Shop.create(name: shop2_name, location: shop2_location)

    visit shops_path

    expect(page).to have_content "All Pet Shops"
    expect(page).to have_content shop1_name
    expect(page).to have_content shop2_name
    expect(page).to have_link shop2.name
  end
end
