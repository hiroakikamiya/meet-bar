class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name , null: false
      t.string :sddress , null: false
      t.integer :tell , null: false
      t.datetime :time , null: false
      t.integer :capacity , null: false
      t.integer :price , null: false
      t.timestamps
    end
  end
end
