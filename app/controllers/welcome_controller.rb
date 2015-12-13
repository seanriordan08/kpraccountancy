class WelcomeController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  before_action :get_featured_news_articles

  def index

  end

  def edit

  end

private

  def get_featured_news_articles
    @news_articles = NewsArticle.get_featured
  end

end
