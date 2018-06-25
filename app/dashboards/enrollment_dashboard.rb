require "administrate/base_dashboard"

class EnrollmentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    athlete: Field::BelongsTo,
    high_school: Field::BelongsTo,
    id: Field::Number,
    high_school_approved: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :athlete,
    :high_school,
    :id,
    :high_school_approved,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :athlete,
    :high_school,
    :id,
    :high_school_approved,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :athlete,
    :high_school,
    :high_school_approved,
  ].freeze

  # Overwrite this method to customize how enrollments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(enrollment)
  #   "Enrollment ##{enrollment.id}"
  # end
end
