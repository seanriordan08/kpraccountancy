class WelcomeController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  before_action :get_featured_news_articles
  after_action :allow_iframe, only: :index

  DOCUMENT_TITLE = "Job_Budget_vs_Actuals"
  DOCUMENT_BUDGET = "Job_Budget_vs_Actuals.xlsx"
  DOCUMENT_BUDGET_PATH = "#{Rails.root}/#{DOCUMENT_BUDGET}"

  def index
    @companies = Company.all
  end

  def download_xlsx
    File.delete(DOCUMENT_BUDGET_PATH) if File.exists?(DOCUMENT_BUDGET_PATH)

    @company = Company.find(params[:companies])
    @job = Job.find(params[:jobs])
    @budgets = Budget.where(job_id: @job.id)
    render xlsx: "job_budget_vs_actuals.xlsx.axlsx", template: "welcome/job_budget_vs_actuals.xlsx.axlsx"

    send_file(DOCUMENT_BUDGET_PATH, filename: DOCUMENT_BUDGET, type: "application/vnd.ms-excel")
  end

private

  def get_featured_news_articles
    @news_articles = NewsArticle.get_featured
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

end
