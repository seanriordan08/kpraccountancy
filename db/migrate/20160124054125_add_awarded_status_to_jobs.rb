class AddAwardedStatusToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :awarded, :boolean, null: true
  end
end
