class DashboardController < ApplicationController
  before_action :check_user

  def check_user
    unless current_user
      redirect_to root_path
    end
  end
end
