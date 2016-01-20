class Budget < ActiveRecord::Base
  require 'csv'

  belongs_to :job
  belongs_to :company_account

  def self.import(file, job_id)
    transaction do
      CSV.foreach(file.path, headers: true, header_converters: lambda { |h| h.try(:downcase) }) do |row|
        budget_hash = row.to_hash
        budget_hash[:job_id] = job_id.to_i
        budget_hash[:company_account_id] = get_company_account_id(budget_hash["number"])
        budget = where(id: budget_hash["id"])

        if budget.count == 1
          budget.first.update_attributes(budget_hash)
        else
          budget_hash = clean_data(budget_hash)
          create!(budget_hash)
        end
      end
    end
  end


  private

  def self.get_company_account_id(number)
    account = CompanyAccount.where(number: number).first
    if account.present?
      account.id
    else
      raise "Budgeted account number #{number} has no associated company account! Please ensure company accounts are up to date"
    end
  end

  def self.clean_data(budget_hash)
    budget_hash["estimated_amount"] = budget_hash["estimated_amount"].to_s
    if budget_hash["estimated_amount"].blank? || budget_hash["estimated_amount"].include?(",") #Remove any commas from estmated_amount
      budget_hash["estimated_amount"].gsub!(/,/, "")
    end
    omit_unnecessary_columns(budget_hash)
  end

  def self.omit_unnecessary_columns(budget_hash)
    budget_hash.delete_if do |key,value|
      case key
      when "number"
        true
      when "name"
        true
      end
    end
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
