require "administrate/base_dashboard"

class AffiliationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    coach: Field::BelongsTo,
    organization: Field::Polymorphic,
    id: Field::Number,
    organization_approved: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :coach,
    :organization,
    :id,
    :organization_approved,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :coach,
    :organization,
    :id,
    :organization_approved,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :coach,
    :organization,
    :organization_approved,
  ].freeze

  # Overwrite this method to customize how affiliations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(affiliation)
  #   "Affiliation ##{affiliation.id}"
  # end
end
