class AddBudgetAssociationToCompanyAccount < ActiveRecord::Migration
  def change
    add_column :budgets, :company_account_id, :integer, null: false
  end
end
