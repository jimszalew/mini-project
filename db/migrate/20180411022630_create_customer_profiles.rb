class CreateCustomerProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_profiles do |t|
      t.string :company
      t.string :delivery_address
      t.string :phone
      t.string :name
      t.string :title

      t.timestamps
    end
  end
end
