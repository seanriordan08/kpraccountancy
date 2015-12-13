class NewsArticle < ActiveRecord::Base

  validates :title, presence: true
  validates :link, presence: true

  def self.get_featured
    where(featured: true).order(created_at: :desc)
  end

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
#  featured   :boolean          default(TRUE)
#  link       :string(255)
#  deleted    :boolean          default(FALSE)
#
