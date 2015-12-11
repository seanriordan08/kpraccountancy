class AddBodyToNewsArticle < ActiveRecord::Migration
  def change
    add_column :news_articles, :body, :string, default: ""
  end
end
