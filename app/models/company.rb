class Company < ActiveRecord::Base

  # has_many :company_accounts

end

# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :string(255)      not null
#  state       :string(255)      not null
#  city        :string(255)      not null
#  website     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
