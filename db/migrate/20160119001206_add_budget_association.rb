class AddBudgetAssociation < ActiveRecord::Migration
  def change
    add_column :budgets, :job_id, :integer
    add_foreign_key :budgets, :jobs
  end
end
