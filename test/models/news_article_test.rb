# == Schema Information
#
# Table name: news_articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :string(255)      default("")
#

require 'test_helper'

class NewsArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
