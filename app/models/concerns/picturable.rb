require 'active_support/concern'

module Picturable
  extend ActiveSupport::Concern

  included do
    def image
      case self.class.to_s
      when Athlete.to_s, Coach.to_s
        avatar
      when College.to_s, HighSchool.to_s
        logo
      else
        raise MissingClassError, "Please specify the Carrierwave Uploader attribute for your class in app/models/concerns/picturable.rb"
      end
    end
  end
end
