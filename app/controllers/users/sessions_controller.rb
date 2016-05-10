class Users::SessionsController < Devise::SessionsController
  layout 'users/login'

  private
  def after_sign_in_path_for(resource)
    users_root_url(:subdomain =>resource.account.domain)
  end
end
