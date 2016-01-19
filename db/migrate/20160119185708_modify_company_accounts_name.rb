class ModifyCompanyAccountsName < ActiveRecord::Migration
  def change
    change_column_null :company_accounts, :name, false
    change_column_null :company_accounts, :number, false
    add_index :company_accounts, :number, unique: true
  end
end
