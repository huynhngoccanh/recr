class SchoolsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @schools = school_searcher.new(params).search
  end

  private
    def school_searcher
      case params[:school_type]
      when "College"
        College::Search
      when "HighSchool"
        HighSchool::Search
      else
        College::Search
      end
    end
end
