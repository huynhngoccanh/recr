class Athletes::Administration::ReferencesController < Athletes::AdministrationController

  def index
    load_references
    build_reference
  end

  def edit
    load_reference
    unless @reference.phone_numbers.any?
      @reference.phone_numbers.build
    end
  end

  def create
    build_reference
    save_reference or render "index"
  end

  def update
    load_reference
    build_reference
    save_reference or render "edit"
  end

  def destroy
    load_reference
    @id = @reference.id
    @reference.destroy
  end

  private

    def load_references
      @references = reference_scope.all.page(params[:page])
    end

    def load_reference
      @reference = reference_scope.find(params[:id])
    end

    def reference_scope
      @athlete.references
    end

    def build_reference
      @reference ||= reference_scope.build
      @reference.attributes = reference_params
    end

    def reference_params
      reference_params = params[:reference]
      reference_params ? reference_params.permit(:relationship, :name, :contact_method, :email, :phone_number,
                                                 phone_numbers_attributes: [:digits, :info, :id, :_destroy]) : {}
    end

    def save_reference
      if @reference.save
        respond_to do |format|
          format.js { render "update" }
          format.html { redirect_to athlete_administration_references_path(@athlete), notice: "reference Saved!" }
        end
      end
    end
end
