class Colleges::Administration::AffiliationsController < Colleges::AdministrationController

  def index
    @coaches = @college.coaches
  end

  def new
    @affiliation = Affiliation.new
  end

  def create
    @transfer = CoachTransfer.new(affiliation_params[:coach_email], @college)
    if @transfer.save
      redirect_to college_administration_affiliations_path(@college)
    else
      @affiliation = Affiliation.new
      render :new
    end
  end

  def destroy
    @affiliation = @college.affiliations.find(params[:id])
    @coach = @affiliation.coach
    @affiliation.destroy
  end

  private

    def affiliation_params
      params.require(:affiliation).permit(:coach_email)
    end
end
