class WelcomeController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    user = User.last
    Rails.logger.debug user.errors.full_messages.first
    flash[:error] = user.errors.full_messages
  end

  def edit

  end


end
