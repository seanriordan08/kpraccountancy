require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
