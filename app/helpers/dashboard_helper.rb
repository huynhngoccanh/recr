module DashboardHelper
  def active?(name)
    (controller_name == name.to_s) ? "active" : ""
  end
end
