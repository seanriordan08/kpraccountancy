module WelcomeHelper

  def company_accounts_last_uploaded(current_user)
    CompanyAccount.get_last_uploaded_date(current_user)
  end

  def budgets_last_uploaded(current_user)
    Budget.get_last_uploaded_date(current_user)
  end

end
