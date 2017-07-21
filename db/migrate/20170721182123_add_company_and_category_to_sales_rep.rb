class AddCompanyAndCategoryToSalesRep < ActiveRecord::Migration[5.1]
  def change
    add_column :sales_reps, :company, :string
    add_column :sales_reps, :category, :string
  end
end
