class NewsArticle < ActiveRecord::Base
end

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
