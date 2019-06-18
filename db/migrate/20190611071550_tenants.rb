class Tenants < ActiveRecord::Migration[5.2]
  def change
    drop_table :tenants
  end
end
