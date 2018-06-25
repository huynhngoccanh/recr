require "administrate/base_dashboard"

class HighlightDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    highlightable: Field::Polymorphic,
    id: Field::Number,
    title: Field::String,
    description: Field::String,
    raw_url: Field::String,
    thumbnail_url: Field::String,
    tagged_positions: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    cached_votes_total: Field::Number,
    cached_votes_score: Field::Number,
    cached_votes_up: Field::Number,
    cached_votes_down: Field::Number,
    cached_weighted_score: Field::Number,
    cached_weighted_total: Field::Number,
    cached_weighted_average: Field::Number.with_options(decimals: 2),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :highlightable,
    :id,
    :title,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :highlightable,
    :id,
    :title,
    :description,
    :raw_url,
    :thumbnail_url,
    :tagged_positions,
    :created_at,
    :updated_at,
    :cached_votes_total,
    :cached_votes_score,
    :cached_votes_up,
    :cached_votes_down,
    :cached_weighted_score,
    :cached_weighted_total,
    :cached_weighted_average,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :highlightable,
    :title,
    :description,
    :raw_url,
    :thumbnail_url,
    :tagged_positions,
    :cached_votes_total,
    :cached_votes_score,
    :cached_votes_up,
    :cached_votes_down,
    :cached_weighted_score,
    :cached_weighted_total,
    :cached_weighted_average,
  ].freeze

  # Overwrite this method to customize how highlights are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(highlight)
  #   "Highlight ##{highlight.id}"
  # end
end
