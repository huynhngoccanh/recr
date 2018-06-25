module AthletePrivatePageTests
  extend ActiveSupport::Concern

  included do

    test "athlete/highlights#edit_index" do
      get edit_athlete_highlights_path(@athlete)
      assert_response :success
    end

    test "athlete/articles#edit_index" do
      get edit_athlete_articles_path(@athlete)
      assert_response :success
    end

    test "athlete/stats#edit_index" do
      get edit_athlete_stats_path(@athlete)
      assert_response :success
    end

    test "athlete/connections#edit_index" do
      get edit_athlete_connections_path(@athlete)
      assert_response :success
    end

    test "athlete/references#edit_index" do
      get edit_athlete_connections_path(@athlete)
      assert_response :success
    end

    test "athletes#edit" do
      get edit_athlete_path(@athlete)
      assert_response :success
    end
  end
end
