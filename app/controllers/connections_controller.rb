require 'csv'

class ConnectionsController < ApplicationController
  def index
    @athletes = current_coach.organization.athletes

    respond_to do |format|
      format.csv do
        @headers = ['First/Last Name', 'City', 'State', 'High School',
          'Position', 'Height', 'Weight', 'Cell Phone #', 'Address', 'Email', 'Avatar',
          'GPA', 'HUDL link']
        headers['Content-Disposition'] = "attachment; filename=\"athletes.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  def current_coach
    current_user.profile
  end
end