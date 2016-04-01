class Shop < ActiveRecord::Base
  has_many :puppies

  def average_price
    puppies.average("price").to_i
  end
end
