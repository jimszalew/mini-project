class AddUserColumnToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_reference :restaurants, :user, index: true, foreign_key: true
  end
end
