class CollegesController < ApplicationController
  layout :resolve_layout

  def index
    @colleges = College::Search.new(params).search
  end

  def show
    load_college
    @college_profile_presenter = CollegeProfilePresenter.new(@college, current_user)
  end

  def new
    build_college
    @college.build_address
  end

  def edit
    load_college
    load_address
    unless @college.phone_numbers.any?
      @college.phone_numbers.build
    end
  end

  def update
    load_college
    build_college
    save_college or 'edit'
  end

  def create
    build_college
    save_college or 'new'
  end

  def order
    params[:coach].each_with_index do |id, index|
      Coach.find(id).update(position: index + 1)
    end
    render status: 200
  end

  private
    def resolve_layout
      case action_name
      when "index"
        "application"
      else
        "profile"
      end
    end

    def load_college
      @college = college_scope.find(params[:id])
      @college_profile_presenter = CollegeProfilePresenter.new(@college, current_user)
    end

    def load_address
      @address = @college.address
      @address ||= @college.build_address
    end

    def college_scope
      College.all
    end

    def build_college
      @college ||= college_scope.build
      @college.attributes = college_params
    end

    def save_college
      if @college.save
        redirect_to edit_college_path(@college)
      end
    end

    def college_params
      college_params = params[:college]
      college_params ? college_params.permit(:name, :logo, :logo_cache, :remove_logo, :initial_coach_name, :initial_coach_phone_number, :division, :enrollment, :team_record, :mascot, :offensive_schema, :defensive_schema, :school_email, :gpa_requirement, :allow_connections,
                                             address_attributes: [:line1, :line1, :city, :state, :zip],
                                             seasonal_schemas_attributes: [:season, :scheme],
                                             phone_numbers_attributes: [:digits, :info, :id, :_destroy]) : {}
    end
end
