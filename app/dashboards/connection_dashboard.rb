require "administrate/base_dashboard"

class ConnectionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    athlete: Field::BelongsTo,
    college: Field::BelongsTo,
    id: Field::Number,
    athlete_approved: Field::Boolean,
    college_approved: Field::Boolean,
    committed: Field::Boolean,
    letter_of_intent_signed: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    last_modified_by_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :athlete,
    :college,
    :id,
    :athlete_approved,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :athlete,
    :college,
    :id,
    :athlete_approved,
    :college_approved,
    :committed,
    :letter_of_intent_signed,
    :created_at,
    :updated_at,
    :last_modified_by_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :athlete,
    :college,
    :athlete_approved,
    :college_approved,
    :committed,
    :letter_of_intent_signed,
    :last_modified_by_id,
  ].freeze

  # Overwrite this method to customize how connections are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(connection)
  #   "Connection ##{connection.id}"
  # end
end
