module HighSchoolPrivatePageTests
  extend ActiveSupport::Concern

  included do

    test "high_school/highlights#edit_index" do
      get edit_high_school_highlights_path(@high_school)
      assert_response :success
    end

    test "high_school/enrollments#edit_index" do
      get edit_high_school_enrollments_path(@high_school)
      assert_response :success
    end

    test "high_schools#edit" do
      get edit_high_school_path(@high_school)
      assert_response :success
    end

    test "high_school/conversations#edit_index" do
      get edit_high_school_conversations_path(@high_school)
      assert_response :success
    end
  end
end

