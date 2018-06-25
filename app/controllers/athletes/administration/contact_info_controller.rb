class Athletes::Administration::ContactInfoController < ApplicationController
  def update
    set_athlete
    if @athlete.update contact_info_params
      redirect_to notifications_path, notice: "Your info has been updated!"
    else
      add_notifications_index_context
      render template: "notifications/index"
    end
  end

  def set_athlete
    @athlete = Athlete.find(params[:id])

    redirect_to notifications_path unless current_user.profile == @athlete
  end

  def contact_info_params
    params.require(:athlete).permit(
      phone_number_attributes: PhoneNumber::PERMITTED_ATTRIBUTES,
      address_attributes: Address::PERMITTED_ATTRIBUTES
    )
  end

  # In order to render errors on the form, we render the page it's set up on.
  # So we need to add some additional context, too.
  def add_notifications_index_context
    @notifications = Notification.where(recipient: current_user).order(created_at: :desc)
    @contact_info_needed = true
  end
end
