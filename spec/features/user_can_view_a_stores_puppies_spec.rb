require 'rails_helper'

RSpec.feature "user can view a stores puppies" do
  scenario "they visit shop page and see all puppies belonging to that shop" do
    shop1_name = "Pup Stop"
    shop2_name = "The Mill"
    shop1_location = "123 Fake St"
    shop2_location = "222 Made-up Ave"
    shop1 = Shop.create(name: shop1_name, location: shop1_location)
    shop2 = Shop.create(name: shop2_name, location: shop2_location)
    puppy1 = Puppy.create(name: "Frank", breed: "Husky", age: 2, shop_id: shop1.id)
    puppy2 = Puppy.create(name: "Tom", breed: "Lab", age: 1, shop_id: shop2.id)
    puppy3 = Puppy.create(name: "Becky", breed: "Poodle", age: 2, shop_id: shop1.id)
    puppy4 = Puppy.create(name: "Jon", breed: "Husky", age: 3, shop_id: shop2.id)
    puppy5 = Puppy.create(name: "Bob", breed: "Hound", age: 2, shop_id: shop1.id)


    visit shops_path

    click_on shop2_name
  
    expect(current_path).to eq shop_path(shop2)
    expect(page).to have_content shop2_name
    expect(page).to have_link "View our Puppies"
  end
end
