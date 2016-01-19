class AddNullConstraintToBudgets < ActiveRecord::Migration
  def change
    change_column :budgets, :company_account_id, :integer, :null => false
    add_column :budgets, :estimated_regular_hours, :integer, :default => 0
    add_column :budgets, :estimated_overtime_hours, :integer, :default => 0
  end
end
