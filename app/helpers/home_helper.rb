module HomeHelper
  def active_link(path)
    path == params[:controller] ? "active" : ""
  end
end
