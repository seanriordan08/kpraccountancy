class AddPositionToNewsArticle < ActiveRecord::Migration
  def change
    add_column :news_articles, :position, :integer, default: 1
  end
end
