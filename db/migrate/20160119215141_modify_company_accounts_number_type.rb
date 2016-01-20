class ModifyCompanyAccountsNumberType < ActiveRecord::Migration
  def change
    change_column :company_accounts, :number, :string, null: false
    change_column :budgets, :estimated_amount, :integer, default: 0
  end
end
