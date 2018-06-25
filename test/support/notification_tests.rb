module NotificationTests
  extend ActiveSupport::Concern

  included do
    test "notifications#index" do
      get notifications_path
      assert_response :success
    end
  end
end
