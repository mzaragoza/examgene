class Users::RegistrationsController < Devise::RegistrationsController
  layout :choose_layout
  expose(:selected_plan) { Plan.find_by_slug(params[:plan]) }

#  after_filter :after_registration, :only => [:create]

  def choose_layout
    'users/login'
  end

  def new
    resource = build_resource({})
    resource.build_account
  end

  def after_inactive_sign_up_path_for(resource)
    users_root_path
  end

  def after_sign_up_fails_path_for(resource)
    new_user_registration_path
  end

  def after_sign_up_path_for(resource)
    session[:just_registered] = true
    sign_in(resource)
    users_root_path
  end

  private
  def sign_up_params
    allow = [
      :email,
      :first_name,
      :last_name,
      :password,
      :password_confirmation,
      account_attributes: [
        :name,
        :domain,
        :plan_id,
      ]
    ]
    params.require(resource_name).permit(allow)
  end

  def after_update_path_for(resource)
    users_root_path(resource)
  end

  def after_registration
    unless resource.new_record?
      create_subscription
    end
  end

  def create_subscription
#    customer = Stripe::Customer.create(
#      :card => options['card_token'],
#      :description => options['description'],
#      :plan => current_account.sign_up_plan.slug,
#      :email => current_user.email,
#      :metadata => {
#        :account_type => account_type,
#        :first_name => current_user.first_name,
#        :last_name => current_user.last_name,
#        :phone => current_user.phone,
#        :user_id => current_user.id,
#        :account_id => current_account.id,
#        :account_name => current_account.name,
#        :number_of_residents => current_account.subscription.minimum_number_of_residents
#      }
#    )
  end

end

