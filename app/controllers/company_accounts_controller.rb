class CompanyAccountsController < ApplicationController

  def index
    @products = Product.all
  end

  def import
    CompanyAccount.import(params[:file])
    redirect_to root_path, notice: "Company Accounts Imported."
  end

end
