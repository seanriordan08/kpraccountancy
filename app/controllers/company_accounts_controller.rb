class CompanyAccountsController < ApplicationController

  def index
    @products = Product.all
  end

  def import
    company_id = params[:companies]
    CompanyAccount.import(params[:file], company_id)
    redirect_to root_path, notice: "Company Accounts Imported."
  end

end
