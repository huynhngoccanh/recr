class DashboardsController < ApplicationController
  before_action :verify_admin!

  def show
  end

  def become_user
    return unless current_user.admin?
    sign_in(:user, User.find(params[:id]), { :bypass => true })
    redirect_to root_url
  end


  private
    def verify_admin!
      redirect_to root_path unless current_user.admin?
    end
end
