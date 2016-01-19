class AddJobAssociation < ActiveRecord::Migration
  def change
    add_column :jobs, :company_id, :integer
    add_foreign_key :jobs, :companies
  end
end
