class WelcomeController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  before_action :get_featured_news_articles
  after_action :allow_iframe, only: :index

  def index
    @companies = Company.all
  end

private

  def get_featured_news_articles
    @news_articles = NewsArticle.get_featured
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

end
