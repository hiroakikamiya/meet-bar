class CreateUserRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :user_restaurants do |t|
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.timestamps
    end
  end
end
