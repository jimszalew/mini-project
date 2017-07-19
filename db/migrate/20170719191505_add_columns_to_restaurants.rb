class AddColumnsToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :description, :string
    add_column :restaurants, :address, :string
    add_column :restaurants, :phone, :string
  end
end
