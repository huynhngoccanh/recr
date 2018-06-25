class Highlight < ApplicationRecord
  belongs_to :highlightable, polymorphic: true

  validates_presence_of :title, :description
  validate :usable_youtube_url

  acts_as_votable

  validate :valid_tagged_positions

  if !!Rails.application.secrets.reduced_searchkick_usage
    searchkick word_start: [:title], settings: {number_of_shards: 1, number_of_replicas: 0}
  else
    searchkick word_start: [:title]
  end

  def search_data
    {
      title: title,
      updated_at: updated_at,
      description: description,
      positions: positions,
      state: highlightable&.state
    }
  end

  def positions
    result = tagged_positions.clone
    if highlightable.is_a? Athlete
      result = result + [highlightable.primary_position] + [highlightable.position_abbreviations]
    end

    result.flatten.compact.uniq
  end

  def embed_code(args={})
    args = Hash(args)
    height = args.fetch(:height, 254)
    width = args.fetch(:width, 450)
    video_info.embed_code(iframe_attributes: { width: width, height: height})
  end

  def thumbnail_medium
    video_info.thumbnail_medium
  end

  def video_info
    VideoInfo.new(raw_url)
  end

  def state
    highlightable.state
  end

  def city
    highlightable.city
  end

  def usable_youtube_url
    unless !!VideoInfo::Providers::Youtube.usable?(raw_url)
      errors.add(:base, "Please enter a valid YouTube URL")
    end
  end

  private
    def valid_tagged_positions
      return true unless tagged_positions.any?

      tagged_positions.each do |abbreviation|
        unless Position.abbreviations.include?(abbreviation)
          errors.add(:tagged_positions, "#{abbreviation} is invalid. Please use a valid position abbreviation.")
        end
      end
    end
end
