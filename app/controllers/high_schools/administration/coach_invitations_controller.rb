class HighSchools::Administration::CoachInvitationsController < HighSchools::AdministrationController
  layout "application"

  rescue_from 'Net::SMTPServerBusy' do |exception|
    render "index", notice: "Please use a valid email."
  end

  def index
    @invitation = CoachInvitation.new
  end

  def create
    @invitation = CoachInvitation.new(invitation_params, @high_school, current_user)

    if @invitation.save
      redirect_to high_school_administration_affiliations_path(@high_school), notice: "Invitations sent!"
    else
      render "index"
    end
  end

  private

  def invitation_params
    params.require(:coach_invitation).permit(new: [:first_name, :last_name, :email])
  end
end
