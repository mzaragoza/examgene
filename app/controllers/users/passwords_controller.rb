class Users::PasswordsController < Devise::PasswordsController
  layout 'users/login'

  protected
  def after_resetting_password_path_for(resource)
    Devise.sign_in_after_reset_password ? users_root_path : new_session_path(resource_name)
  end
end

