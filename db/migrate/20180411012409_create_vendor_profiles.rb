class CreateVendorProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_profiles do |t|
      t.string :company
      t.string :category
      t.string :phone
      t.string :name
      t.string :title

      t.timestamps
    end
  end
end
