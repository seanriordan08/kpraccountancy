class Budget < ActiveRecord::Base
  acts_as_xlsx

  require 'csv'

  belongs_to :job
  belongs_to :company_account

  DATETIME_FORMAT = '%e %b %Y %I:%M:%S %p'

  def self.import(file, job_id)
    transaction do
      CSV.foreach(file.path, headers: true, header_converters: lambda { |h| h.try(:downcase) }) do |row|
        budget_hash = row.to_hash
        next if nothing_budgeted?(budget_hash)

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

  def self.get_last_uploaded_date(current_user)
    if CompanyAccount.count('created_at') == 0
      nil
    else
      timestamp = order(:created_at).last.created_at
      timestamp.in_time_zone(current_user.time_zone).strftime(DATETIME_FORMAT)
    end
  end


  private

  def self.nothing_budgeted?(budget_hash)
    (budget_hash["estimated_amount"].to_i + budget_hash["estimated_regular_hours"].to_i + budget_hash["estimated_overtime_hours"].to_i) == 0
  end

  def self.get_company_account_id(number)
    account = CompanyAccount.where(number: number).first
    if account.present?
      account.id
    else
      raise "Budgeted account number #{number} has no associated company account! Please ensure company accounts are up to date"
    end
  end

  def self.clean_data(budget_hash)
    budget_hash["estimated_amount"] = remove_integer_commas(budget_hash["estimated_amount"])
    budget_hash["estimated_regular_hours"] = remove_integer_commas(budget_hash["estimated_regular_hours"])
    budget_hash["estimated_overtime_hours"] = remove_integer_commas(budget_hash["estimated_overtime_hours"])
    omit_unnecessary_columns(budget_hash)
  end

  def self.remove_integer_commas(budget_hash_value)
    if budget_hash_value.present? && budget_hash_value.include?(",")
      budget_hash_value.gsub!(/,/, "")
    end
    budget_hash_value.to_i
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
#  estimated_amount         :integer          default(0)
#  company_account_id       :integer          not null
#  estimated_regular_hours  :integer          default(0)
#  estimated_overtime_hours :integer          default(0)
#
# Indexes
#
#  fk_rails_52dd444ed7  (company_account_id)
#  fk_rails_9c80a19020  (job_id)
#
