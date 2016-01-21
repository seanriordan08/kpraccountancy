class WelcomeController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  before_action :get_featured_news_articles
  after_action :allow_iframe, only: :index

  def index
    @companies = Company.all
  end

  def download_xlsx
    company_id = params[:company_id]
    job_id = 1 #params[:job_id]
    @budgets = Budget.where(job_id: job_id)
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: "Basic work sheet") do |sheet|
      sheet.add_row ["Estimated Amount", "Estimated Regular Hours", "Estimated Overtime Hours"]
      @budgets.each do |column|
        sheet.add_row [column.estimated_amount, column.estimated_regular_hours, column.estimated_overtime_hours]
      end
    end
    package.serialize("Basic_Budget.xlsx")
    send_file("#{Rails.root}/Basic_Budget.xlsx", filename: "Basic_Budget.xlsx", type: "application/vnd.ms-excel")
  end

private

  def get_featured_news_articles
    @news_articles = NewsArticle.get_featured
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

end
