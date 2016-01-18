class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name, null: false
      t.string :state, null: false
      t.string :city, null: false
      t.timestamps null: false
    end
  end
end
