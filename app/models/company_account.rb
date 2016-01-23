class CompanyAccount < ActiveRecord::Base
  require 'csv'

  belongs_to :company
  has_many :budgets

  DATETIME_FORMAT = '%e %b %Y %I:%M:%S %p'

  def self.import(file, company_id)
    CSV.foreach(file.path, headers: true, header_converters: lambda { |h| h.try(:downcase) }) do |row|

      company_account_hash = row.to_hash # exclude the price field
      company_account_hash[:company_id] = company_id
      company_account = where(id: company_account_hash["id"])

      if company_account.count == 1
        company_account.first.update_attributes(company_account_hash)
      else
        create!(company_account_hash)
      end # end if !company_account.nil?
    end # end CSV.foreach
  end # end self.import(file)

  def self.get_last_uploaded_date(current_user)
    if CompanyAccount.count('created_at') == 0
      nil
    else
      timestamp = order(:created_at).last.created_at
      timestamp.in_time_zone(current_user.time_zone).strftime(DATETIME_FORMAT)
    end
  end

end

# == Schema Information
#
# Table name: company_accounts
#
#  id           :integer          not null, primary key
#  number       :string(255)      not null
#  name         :string(255)      not null
#  account_type :string(255)
#  detail_type  :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_id   :integer
#
# Indexes
#
#  fk_rails_f9fca01a1d               (company_id)
#  index_company_accounts_on_number  (number) UNIQUE
#
