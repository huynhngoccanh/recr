module StaticPageTests
  extend ActiveSupport::Concern

  included do
    test "root_path" do
      get root_path
      assert_response :success
    end

    test "about_path" do
      get about_path
      assert_response :success
    end

    test "terms_path" do
      get terms_path
      assert_response :success
    end

    test "advertise_path" do
      get advertise_path
      assert_response :success
    end

    test "contact_path" do
      get contact_path
      assert_response :success
    end
  end
end
