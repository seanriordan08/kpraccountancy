class ModifyCompanyAccountsNumberType < ActiveRecord::Migration
  def change
    change_column :company_accounts, :number, :string, null: false
  end
end
