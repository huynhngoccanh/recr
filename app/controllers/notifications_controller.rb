class NotificationsController < ApplicationController
  before_action :authenticate_user!
  after_action :mark_as_read, only: [:index]
  after_action  :mark_contact_info_requested, only: [:index]

	def index
    if current_user.athlete? && !current_user.profile.has_contact_info?
      @contact_info_needed = true
      @athlete = current_user.profile
      @athlete.build_phone_number unless @athlete.phone_number
      @athlete.build_address unless @athlete.address
    end
    @notifications = Notification.where(recipient: current_user).order(created_at: :desc)
	end

  private

    def mark_as_read
      @notifications.update_all(read_at: Time.zone.now)
    end

    def mark_contact_info_requested
      session[:request_contact_info] = true
    end
end
