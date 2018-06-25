require "administrate/base_dashboard"

class ReferenceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    athlete: Field::BelongsTo,
    phone_numbers: Field::HasMany,
    id: Field::Number,
    relationship: Field::String,
    name: Field::String,
    contact_method: Field::String,
    email: Field::String,
    phone_number: Field::String,
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
    :phone_numbers,
    :id,
    :relationship,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :athlete,
    :phone_numbers,
    :id,
    :relationship,
    :name,
    :contact_method,
    :email,
    :phone_number,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :athlete,
    :phone_numbers,
    :relationship,
    :name,
    :contact_method,
    :email,
    :phone_number,
  ].freeze

  # Overwrite this method to customize how references are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(reference)
  #   "Reference ##{reference.id}"
  # end
end
