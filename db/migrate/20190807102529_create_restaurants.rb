class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.references :host, foreign_key: { to_table: :users }
      t.string :catchcopy , null: false
      t.string :shop_name , null: false
      t.string :address , null: false
      t.integer :price , null: false
      t.integer :capacity , null: false
      t.date :reserve_date , null: false
      t.time :reserve_time , null: false
      t.text :comment
      t.timestamps
    end
  end
end
