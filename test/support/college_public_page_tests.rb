module CollegePublicPageTests
  extend ActiveSupport::Concern

  included do
    test "college#show" do
      get college_path(@college)
      assert_response :success
    end

    test "college/connections#index" do
      get college_connections_path(@college)
      assert_response :success
    end

    test "college/highlights#index" do
      get college_connections_path(@college)
      assert_response :success
    end
  end
end
