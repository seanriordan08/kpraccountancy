class Job < ActiveRecord::Base

  belongs_to :company

  def self.get_jobs
    Job.all
  end

end

# == Schema Information
#
# Table name: jobs
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  state      :string(255)      not null
#  city       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
