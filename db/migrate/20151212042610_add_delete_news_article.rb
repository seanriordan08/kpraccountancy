class AddDeleteNewsArticle < ActiveRecord::Migration
  def change
    add_column :news_articles, :deleted, :boolean, default: false
  end
end
