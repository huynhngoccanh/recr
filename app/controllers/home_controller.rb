class HomeController < ApplicationController
  skip_before_action :authenticate_user!, except: [:show, :index]

  def index
  end

  def about
  end

  def search
  end

  def contact
  end

  def who_is_that
  end

  def update_online_time
    current_user.update_columns(
      last_online_at: Time.current
    )
  end
end
