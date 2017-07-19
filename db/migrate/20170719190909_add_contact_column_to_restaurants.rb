class AddContactColumnToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_reference :restaurants, :contact, index: true, foreign_key: true
  end
end
