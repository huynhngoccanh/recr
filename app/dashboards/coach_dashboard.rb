require "administrate/base_dashboard"

class CoachDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::HasOne,
    phone_numbers: Field::HasMany,
    affiliation: Field::HasOne,
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    role: Field::String.with_options(searchable: false),
    role_name: Field::String,
    bio: Field::Text,
    avatar: Field::String,
    position: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :phone_numbers,
    :affiliation,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :phone_numbers,
    :affiliation,
    :id,
    :first_name,
    :last_name,
    :role,
    :role_name,
    :bio,
    :avatar,
    :position,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :phone_numbers,
    :affiliation,
    :first_name,
    :last_name,
    :role,
    :role_name,
    :bio,
    :avatar,
    :position,
  ].freeze

  # Overwrite this method to customize how coaches are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(coach)
  #   "Coach ##{coach.id}"
  # end
end
