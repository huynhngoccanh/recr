module SearchPageTests
  extend ActiveSupport::Concern

  included do
    # Note: unless you have elasticsearch stood up in your testing environment, the searches with queries will fail.
    test "athlete search" do
      get athletes_path
      assert_response :success
      #get athletes_path, params: { q: "1" }
      #assert_response :success
    end

    test "highlights search" do
      get search_highlights_path
      assert_response :success
      #get search_highlights_path, params: { q: "1" }
      #assert_response :success
    end

    test "schools search" do
      get schools_path
      assert_response :success
      #get schools_path, params: { q: "1" }
      #assert_response :success
    end
  end
end
