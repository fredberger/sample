class AdminController < ApplicationController
  before_action :check_user

  def check_user
    if current_user
      if current_user.admin?
      else
        redirect_to dashboard_root_path
      end
    else
      redirect_to root_path
    end
  end
end
