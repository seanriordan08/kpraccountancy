class CreateCompanyAccounts < ActiveRecord::Migration
  def change
    create_table :company_accounts do |t|
      t.integer :number
      t.string :name
      t.string :type
      t.string :detail_type

      t.timestamps null: false
    end
  end
end
