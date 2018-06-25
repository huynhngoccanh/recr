class HighSchools::Administration::AthleteInvitationsController < HighSchools::AdministrationController
  layout :resolve_layout

  def summary
  end

  def index
    @invitation = AthleteInvitation.new
  end

  def create
    @invitation = AthleteInvitation.new(invitation_params, @high_school, current_user)

    if @invitation.save
      redirect_to high_school_administration_athlete_invitations_path(@high_school), notice: "Invitations sent!"
    else
      render "index"
    end
  end

  def add_new_invite_field
    respond_to do |format|
      format.js
    end
  end

  private

    def resolve_layout
      case params[:action]
      when "index", "create"
        "application"
      else
        "profile"
      end
    end

    def invitation_params
      params.require(:athlete_invitation).permit(new: [:first_name, :last_name, :email])
    end
end
