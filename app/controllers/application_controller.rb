class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :verify_registration_completed, if: :user_signed_in?
  before_action :authenticate_user!, except: [:show, :index]

  skip_before_action :verify_registration_completed, if: :devise_controller?

  private
    def verify_registration_completed
      if current_user.undetermined?
        redirect_to new_athletes_registration_path
      end

      if current_user.athlete? && !current_user.profile.valid?
        redirect_to new_athletes_registrations_path(dont_show_errors: 1)
      end
    end

  	def admin?
  		current_user.admin?
  	end

    def dashboard
      DashboardView.new(dashboard_resource, current_user)
    end
end
