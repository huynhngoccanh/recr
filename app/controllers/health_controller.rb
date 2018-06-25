class HealthController < ApplicationController
  before_action :verify_admin

  def index
  end

  def reindex
    Athlete.reindex
    College.reindex
    HighSchool.reindex
    Highlight.reindex

    redirect_to health_path, notice: "Successfully reindexed all available data."
  end

  private
    def verify_admin
      redirect_to root_path unless user_signed_in? && current_user.admin?
    end
end
