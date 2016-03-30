class AddShopIdToPuppies < ActiveRecord::Migration
  def change
    add_reference :puppies, :shop, index: true, foreign_key: true
  end
end
