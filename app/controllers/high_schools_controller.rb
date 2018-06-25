class HighSchoolsController < ApplicationController
  skip_before_action :verify_registration_completed, only: [:create]

  layout :resolve_layout

  def edit_index
    load_high_school
  end

  def show
    load_high_school
  end

  def new
    build_high_school
    @high_school.build_address
  end

  def create
    build_high_school
    respond_to do |format|
      if @high_school.save
        @high_school.update(added_by_id: current_user.id)
        format.js
      else
        format.js
      end
    end
  end

  def edit
    load_high_school
    unless @high_school.phone_numbers.any?
      @high_school.phone_numbers.build
    end
  end

  def update
    load_high_school
    build_high_school

    if @high_school.save
      redirect_to edit_high_school_path(@high_school), notice: "Update successful!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def resolve_layout
      case action_name
      when "index", "new"
        "application"
      else
        "profile"
      end
    end

    def high_school_scope
      HighSchool
    end

    def load_high_school
      @high_school = high_school_scope.find(params[:id])
    end

    def load_high_schools
      @high_schools = high_school_scope.all
    end

    def build_high_school
      @high_school ||= high_school_scope.new
      @high_school.attributes = high_school_params
    end

    def high_school_params
      high_school_params = params[:high_school]
      high_school_params ? high_school_params.permit(:name, :school_email, :team_record, :mascot, :enrollment, :division, :offensive_schema, :defensive_schema, :logo, :logo_cache, :finish_onboarding,
                                                     :registration_coach_phone_number, :registration_coach_name, :counselor_name, :counselor_email, :counselor_phone_number,
                                                     address_attributes: [:id, :line1, :line1, :city, :state, :zip],
                                                     phone_numbers_attributes: [:digits, :info, :id, :_destroy]) : {}
    end
end
