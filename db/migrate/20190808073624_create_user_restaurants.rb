class CreateUserRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :user_restaurants do |t|
      t.references :attender, foreign_key: { to_table: :users }
      t.references :restaurant, foreign_key: true
      t.timestamps
    end
  end
end