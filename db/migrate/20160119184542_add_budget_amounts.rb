class AddBudgetAmounts < ActiveRecord::Migration
  def change
    add_column :budgets, :estimated_amount, :integer
  end
end
