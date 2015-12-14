# == Schema Information
#
# Table name: news_articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :string(255)      default("")
#  featured   :boolean          default(TRUE)
#  link       :string(255)
#  deleted    :boolean          default(FALSE)
#  position   :integer          default(1)
#

require 'test_helper'

class NewsArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
