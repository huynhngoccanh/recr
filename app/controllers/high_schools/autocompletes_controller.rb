class HighSchools::AutocompletesController < ApplicationController
  skip_before_action :verify_registration_completed

  def index
    high_schools = HighSchool.search(params[:term], fields: [{name: :word_start}], limit: 10).results
    autocomplete_options = set_autocomplete_options(high_schools)
    render json: autocomplete_options
  end

  private
    def set_autocomplete_options(high_schools)
      result = []
      high_schools.map do |high_school|
        result.push({
          name: high_school.name,
          address: high_school.full_address,
          id: high_school.id
        })
      end
      result.push({ name: "Add New High School", address: "", id: -1 })
      result
    end
end
