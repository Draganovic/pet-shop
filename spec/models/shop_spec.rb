require 'rails_helper'

RSpec.describe Shop, type: :model do
    it "averages the price of the puppies belinging to a store" do
      shop_name = "Pup Stop"
      shop_location = "123 Fake St"
      shop = Shop.create(name: shop_name, location: shop_location)
      puppy1 = Puppy.create(name: "Frank", breed: "Husky", age: 2, shop_id: shop.id, price:2)
      puppy2 = Puppy.create(name: "Becky", breed: "Poodle", age: 2, shop_id: shop.id, price:2)
      puppy3 = Puppy.create(name: "Bob", breed: "Hound", age: 2, shop_id: shop.id, price:2)

      expect(shop.average_price).to eq(2)
    end
end
