# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def login_logout
    if current_user
      "#{current_user.login} #{link_to "(logout)", logout_path}"
    else
      link_to "Login", new_user_session_path
    end
  end
end
