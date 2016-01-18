class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :state, null: false
      t.string :city, null: false
      t.string :website
      t.timestamps null: false
    end
  end
end
