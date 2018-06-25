module AthletePublicPageTests
  extend ActiveSupport::Concern

  included do
    test "athlete#show" do
      get athlete_path(@athlete)
      assert_response :redirect
      follow_redirect!
      assert_response :success
    end

    test "athlete/stats#index" do
      get athlete_stats_path(@athlete)
      assert_response :success
    end

    test "athlete/highlights#index" do
      get athlete_highlights_path(@athlete)
      assert_response :success
    end

    test "athlete/articles#index" do
      get athlete_articles_path(@athlete)
      assert_response :success
    end

  end
end
