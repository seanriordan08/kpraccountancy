class AddFeaturedToArticles < ActiveRecord::Migration
  def change
    add_column :news_articles, :featured, :boolean, default: false
  end
end
