class AddPhoneAndEmailToSalesRep < ActiveRecord::Migration[5.1]
  def change
    add_column :sales_reps, :phone, :string
    add_column :sales_reps, :email, :string
  end
end
