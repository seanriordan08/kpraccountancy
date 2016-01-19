class AddFkToBudgets < ActiveRecord::Migration
  def change
    add_foreign_key :budgets, :company_accounts
  end
end
