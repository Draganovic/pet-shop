require 'rails_helper'

RSpec.describe User, type: :model do
  context "attributes" do
    let(:user_name) { "Admir" }
    let(:password) { "password" }
    let(:user) { User.create!(user_name: user_name, password: password) }

    describe "#user_name" do
      it "has a user_name" do
        expect(user.send(:user_name)).to eq(user_name)
      end
    end
    describe "#password" do
      it "has a password" do
        expect(user.send(:password)).to eq(password)
      end
    end
  end

  context "relationships" do
    let(:user_name) { "Admir" }
    let(:password) { "password" }
    let(:name) { "Frank" }
    let(:breed) { "Husky" }
    let(:age) { 2 }
    let(:user_with_puppy) { User.create!(user_name: user_name, password: password) }
    let(:user_without_puppy) { User.create!(user_name: user_name, password: password) }
    let(:puppy) { Puppy.create!(name: name, breed: breed, age: age, user_id: user_with_puppy.id) }

    describe "#puppies" do
      it "returns empty array if user has no puppies" do
        expect(user_without_puppy.send(:puppies)).to eq( [] )
      end
      it "returns puppies associated with a user" do
        expect(user_with_puppy.send(:puppies)).to eq( [puppy] )
      end
    end
  end
end
