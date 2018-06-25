require "administrate/base_dashboard"

class AthleteDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::HasOne,
    enrollment: Field::HasOne,
    high_school: Field::HasOne,
    connections: Field::HasMany,
    articles: Field::HasMany,
    highlights: Field::HasMany,
    references: Field::HasMany,
    colleges: Field::HasMany,
    stats: Field::HasMany,
    conversations: Field::HasMany,
    messages: Field::HasMany,
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    height: Field::Number,
    weight: Field::Number,
    avatar: Field::String,
    primary_position: Field::String,
    jersey_number: Field::Number,
    bench_press: Field::Number,
    deadlift: Field::Number,
    squat: Field::Number,
    forty_yard_dash: Field::Number.with_options(decimals: 2),
    hundred_yard_dash: Field::Number.with_options(decimals: 2),
    inspirational_quote: Field::Text,
    class_of: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    gpa: Field::String.with_options(searchable: false),
    display_gpa: Field::Boolean,
    hudl_url: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :enrollment,
    :high_school,
    :connections,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :enrollment,
    :high_school,
    :connections,
    :articles,
    :highlights,
    :references,
    :colleges,
    :conversations,
    :messages,
    :id,
    :first_name,
    :last_name,
    :height,
    :weight,
    :avatar,
    :primary_position,
    :jersey_number,
    :bench_press,
    :deadlift,
    :squat,
    :forty_yard_dash,
    :hundred_yard_dash,
    :inspirational_quote,
    :class_of,
    :created_at,
    :updated_at,
    :gpa,
    :display_gpa,
    :hudl_url,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :enrollment,
    :high_school,
    :connections,
    :articles,
    :highlights,
    :references,
    :colleges,
    :conversations,
    :messages,
    :first_name,
    :last_name,
    :height,
    :weight,
    :avatar,
    :primary_position,
    :jersey_number,
    :bench_press,
    :deadlift,
    :squat,
    :forty_yard_dash,
    :hundred_yard_dash,
    :inspirational_quote,
    :class_of,
    :gpa,
    :display_gpa,
    :hudl_url,
  ].freeze

  # Overwrite this method to customize how athletes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(athlete)
  #   "Athlete ##{athlete.id}"
  # end
end
