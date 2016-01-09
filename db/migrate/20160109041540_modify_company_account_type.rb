class ModifyCompanyAccountType < ActiveRecord::Migration
  def change
    rename_column :company_accounts, :type, :account_type
  end
end
