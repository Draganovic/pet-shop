class AddPriceToPuppies < ActiveRecord::Migration
  def change
    add_column :puppies, :price, :integer
  end
end
