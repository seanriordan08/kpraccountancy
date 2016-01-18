class BudgetsController < ApplicationController

  def import
    company_id = params[:companies]
    job_id = params[:jobs]
    Budget.import(params[:file], company_id)
    redirect_to root_path, notice: "Company Accounts Imported."
  end

end
