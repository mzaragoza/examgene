class Users::SessionsController < Devise::SessionsController
  layout 'users/login'

  private
  def after_sign_in_path_for(resource)
    session[:just_logged_in] = true
    users_root_path
  end
end
