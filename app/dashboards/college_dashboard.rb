require "administrate/base_dashboard"

class CollegeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    affiliations: Field::HasMany,
    coaches: Field::HasMany,
    coach_users: Field::HasMany.with_options(class_name: "User"),
    address: Field::HasOne,
    connections: Field::HasMany,
    athletes: Field::HasMany,
    approved_athletes: Field::HasMany.with_options(class_name: "Athlete"),
    conversations: Field::HasMany,
    highlights: Field::HasMany,
    phone_numbers: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    logo: Field::Text,
    added_by_id: Field::Number,
    offensive_schema: Field::Text,
    defensive_schema: Field::Text,
    division: Field::Number,
    enrollment: Field::Number,
    team_record: Field::String,
    mascot: Field::String,
    school_email: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    gpa_requirement: Field::String.with_options(searchable: false),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :affiliations,
    :coaches,
    :coach_users,
    :address,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :affiliations,
    :coaches,
    :coach_users,
    :address,
    :connections,
    :athletes,
    :approved_athletes,
    :conversations,
    :highlights,
    :phone_numbers,
    :id,
    :name,
    :logo,
    :added_by_id,
    :offensive_schema,
    :defensive_schema,
    :division,
    :enrollment,
    :team_record,
    :mascot,
    :school_email,
    :created_at,
    :updated_at,
    :gpa_requirement,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :affiliations,
    :coaches,
    :coach_users,
    :address,
    :connections,
    :athletes,
    :approved_athletes,
    :conversations,
    :highlights,
    :phone_numbers,
    :name,
    :logo,
    :added_by_id,
    :offensive_schema,
    :defensive_schema,
    :division,
    :enrollment,
    :team_record,
    :mascot,
    :school_email,
    :gpa_requirement,
  ].freeze

  # Overwrite this method to customize how colleges are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(college)
  #   "College ##{college.id}"
  # end
end
