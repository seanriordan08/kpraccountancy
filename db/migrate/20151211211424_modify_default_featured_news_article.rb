class ModifyDefaultFeaturedNewsArticle < ActiveRecord::Migration
  def change
    change_column :news_articles, :featured, :boolean, default: true
  end
end
