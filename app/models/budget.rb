class Budget < ActiveRecord::Base
  require 'csv'

  belongs_to :job
  belongs_to :company_account

  def self.import(file, company_id, job_id)
    CSV.foreach(file.path, headers: true) do |row|

      budget_hash = row.to_hash # exclude the price field
      budget_hash[:company_id] = company_id
      budget_hash[:job_id] = job_id
      budget_hash[:company_account_id] = get_company_account_id(budget_hash[:number])
      budget = where(id: budget_hash["id"])

      if budget.count == 1
        budget.first.update_attributes(budget_hash)
      else
        create!(budget_hash)
      end # end if !company_account.nil?
    end # end CSV.foreach
  end # end self.import(file)


  private

  def self.get_company_account_id(number)
    account = CompanyAccount.where(number: number).first
    account.id
  end

end

# == Schema Information
#
# Table name: budgets
#
#  id                       :integer          not null, primary key
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  job_id                   :integer
#  estimated_amount         :integer
#  company_account_id       :integer          not null
#  estimated_regular_hours  :integer          default(0)
#  estimated_overtime_hours :integer          default(0)
#
# Indexes
#
#  fk_rails_52dd444ed7  (company_account_id)
#  fk_rails_9c80a19020  (job_id)
#
