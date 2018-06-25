module HighSchoolPublicPageTests
  extend ActiveSupport::Concern

  included do
    test "high_school#show" do
      get high_school_path(@high_school)
      assert_response :success
    end

    test "high_school/connections#index" do
      get high_school_connections_path(@high_school)
      assert_response :success
    end

    test "high_school/highlights#index" do
      get high_school_connections_path(@high_school)
      assert_response :success
    end
  end
end
