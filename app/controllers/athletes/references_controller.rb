class Athletes::ReferencesController < ApplicationController
  include AthleteScoped

  layout "profile"

  def index
    @references = @athlete.references.page(params[:page])
  end
end

