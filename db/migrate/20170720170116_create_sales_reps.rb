class CreateSalesReps < ActiveRecord::Migration[5.1]
  def change
    create_table :sales_reps do |t|
      t.string :name

      t.timestamps
    end
  end
end
