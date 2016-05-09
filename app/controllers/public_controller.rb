class PublicController < ApplicationController
  before_action :check_user

  def check_user
    if current_user
      redirect_to users_root_path
    end
  end
end
