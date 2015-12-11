class Account < ActiveRecord::Base
  has_many :users, dependent: :destroy

end

# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
