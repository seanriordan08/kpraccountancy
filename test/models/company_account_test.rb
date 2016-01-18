require 'test_helper'

class CompanyAccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
#  company_id   :integer
#
# Indexes
#
#  fk_rails_f9fca01a1d  (company_id)
#
