class BudgetsController < ApplicationController

  def import
    job_id = params[:jobs]
    Budget.import(params[:file], job_id)
    redirect_to root_path, notice: "Company Accounts Imported."
  end

end