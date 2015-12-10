class WelcomeController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    Rails.logger.debug
  end

  def edit

  end
end
