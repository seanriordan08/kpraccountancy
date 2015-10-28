class User < ActiveRecord::Base
  belongs_to :account

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

end
