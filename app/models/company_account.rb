class CompanyAccount < ActiveRecord::Base

  require 'csv'


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      company_account_hash = row.to_hash # exclude the price field
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
# Table name: company_accounts
#
#  id           :integer          not null, primary key
#  number       :integer
#  name         :string(255)
#  account_type :string(255)
#  detail_type  :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
