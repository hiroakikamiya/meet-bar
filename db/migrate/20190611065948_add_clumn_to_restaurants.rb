class AddClumnToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :catchcopy, :string
    add_column :restaurants, :shop_name, :string
    add_column :restaurants, :comment, :text
    remove_column :restaurants, :name 
    remove_column :restaurants, :tell
  end
end
