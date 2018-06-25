class HighSchools::Administration::AffiliationsController < HighSchools::AdministrationController

  def index
    @coaches = @high_school.coaches
  end

  def new
    @affiliation = Affiliation.new
  end

  def create
    @transfer = CoachTransfer.new(affiliation_params[:coach_email], @high_school)
    if @transfer.save
      redirect_to high_school_administration_affiliations_path(@high_school)
    else
      @affiliation = Affiliation.new
      render :new
    end
  end

  def destroy
    @affiliation = @high_school.affiliations.find(params[:id])
    @coach = @affiliation.coach
    @affiliation.destroy
  end

  private

    def affiliation_params
      params.require(:affiliation).permit(:coach_email)
    end
end
