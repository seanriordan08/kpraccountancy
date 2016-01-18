class AddCompanyRelationships < ActiveRecord::Migration
  def change
    add_column :company_accounts, :company_id, :integer
    add_foreign_key :company_accounts, :companies
  end
end
