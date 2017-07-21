class AddUserColumnToSalesReps < ActiveRecord::Migration[5.1]
  def change
    add_reference :sales_reps, :user, index: true, foreign_key: true
  end
end
