require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
