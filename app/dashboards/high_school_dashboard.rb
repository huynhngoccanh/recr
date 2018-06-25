require "administrate/base_dashboard"

class HighSchoolDashboard < Administrate::BaseDashboard
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
    enrollments: Field::HasMany,
    athletes: Field::HasMany,
    athlete_users: Field::HasMany.with_options(class_name: "User"),
    connections: Field::HasMany,
    recruited_athletes: Field::HasMany.with_options(class_name: "Athlete"),
    highlights: Field::HasMany,
    conversations: Field::HasMany,
    phone_numbers: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    logo: Field::Text,
    added_by_id: Field::Number,
    offensive_schema: Field::Text,
    defensive_schema: Field::Text,
    enrollment: Field::Number,
    team_record: Field::String,
    mascot: Field::String,
    school_email: Field::String,
    registration_coach_name: Field::String,
    registration_coach_phone_number: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    counselor_name: Field::String,
    counselor_email: Field::String,
    counselor_phone_number: Field::String,
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
    :enrollments,
    :athletes,
    :athlete_users,
    :connections,
    :recruited_athletes,
    :highlights,
    :conversations,
    :phone_numbers,
    :id,
    :name,
    :logo,
    :added_by_id,
    :offensive_schema,
    :defensive_schema,
    :enrollment,
    :team_record,
    :mascot,
    :school_email,
    :registration_coach_name,
    :registration_coach_phone_number,
    :created_at,
    :updated_at,
    :counselor_name,
    :counselor_email,
    :counselor_phone_number,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :affiliations,
    :coaches,
    :coach_users,
    :address,
    :enrollments,
    :athletes,
    :athlete_users,
    :connections,
    :recruited_athletes,
    :highlights,
    :conversations,
    :phone_numbers,
    :name,
    :logo,
    :added_by_id,
    :offensive_schema,
    :defensive_schema,
    :enrollment,
    :team_record,
    :mascot,
    :school_email,
    :registration_coach_name,
    :registration_coach_phone_number,
    :counselor_name,
    :counselor_email,
    :counselor_phone_number,
  ].freeze

  # Overwrite this method to customize how high schools are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(high_school)
  #   "HighSchool ##{high_school.id}"
  # end
end
