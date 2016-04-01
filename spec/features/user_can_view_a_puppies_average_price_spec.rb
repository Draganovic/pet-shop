require 'rails_helper'

RSpec.feature "user can view average puppy price" do
  scenario 'they see average price for specific store' do
    shop1_name = "Pup Stop"
    shop2_name = "The Mill"
    shop1_location = "123 Fake St"
    shop2_location = "222 Made-up Ave"
    shop1 = Shop.create(name: shop1_name, location: shop1_location)
    shop2 = Shop.create(name: shop2_name, location: shop2_location)
    puppy1 = Puppy.create(name: "Frank", breed: "Husky", age: 2, shop_id: shop1.id, price:2)
    puppy2 = Puppy.create(name: "Tom", breed: "Lab", age: 1, shop_id: shop2.id, price:3)
    puppy3 = Puppy.create(name: "Becky", breed: "Poodle", age: 2, shop_id: shop1.id, price:2)
    puppy4 = Puppy.create(name: "Jon", breed: "Husky", age: 3, shop_id: shop2.id, price:3)
    puppy5 = Puppy.create(name: "Bob", breed: "Hound", age: 2, shop_id: shop1.id, price:2)

    visit shops_path
    save_and_open_page
    

    expect(page).to have_content "Average Puppy price $3"
    expect(page).to have_content "Average Puppy price $2"
  end
end
