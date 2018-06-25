class HighSchools::EnrollmentsController < ApplicationController
  include HighSchoolScoped

  layout "profile"

  def edit_index
    @enrollments = @high_school.enrollments
  end

  def update
    set_enrollment
    @enrollment.update enrollment_params
  end

  def destroy
    set_enrollment
    @id = @enrollment.id
    @enrollment.destroy
    respond_to do |format|
      format.js
      #format.html { redirect_to edit_high_school_enrollments_path(@high_school), notice: "Enrollment Deleted" }
    end
  end

  private
    def enrollment_params
      params.require(:enrollment).permit(:high_school_approved)
    end

    def set_enrollment
      @enrollment = @high_school.enrollments.find(params[:id])
    end
end
