module CollegePrivatePageTests
  extend ActiveSupport::Concern

  included do
    test "college/highlights#edit_index" do
      get edit_college_highlights_path(@college)
      assert_response :success
    end

    test "college/connections#edit_index" do
      get edit_college_connections_path(@college)
      assert_response :success
    end

    test "colleges#edit" do
      get edit_college_path(@college)
      assert_response :success
    end

    test "college/conversations#edit_index" do
      get edit_college_conversations_path(@college)
      assert_response :success
    end
  end
end
