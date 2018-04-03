class RemoveContacts < ActiveRecord::Migration[5.1]
  def change
    drop_table :restaurants
    drop_table :sales_reps
    drop_table :contacts
  end
end
