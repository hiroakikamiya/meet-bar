class Users < ActiveRecord::Migration[5.2]
  def change
    drop_table :restaurant_users
  end
end
