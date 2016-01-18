class Budget < ActiveRecord::Base
  require 'csv'

  def self.import(file, company_id)
    CSV.foreach(file.path, headers: true) do |row|

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

end

# == Schema Information
#
# Table name: budgets
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
