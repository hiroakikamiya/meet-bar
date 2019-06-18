class Restaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :reserve_date, :date
    add_column :restaurants, :reserve_time, :time
    remove_column :restaurants, :time
  end
end
