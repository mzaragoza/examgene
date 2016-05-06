class Managers::AccountsController < ManagerController
  expose(:accounts){ Account.all.order('ID DESC') }
  expose(:account, attributes: :account_params)

  def create
    if account.save
      flash[:notice] = t(:account_was_successfully_created)
      redirect_to managers_accounts_path
    else
      render :new
    end
  end

  def update
    if account.save
      flash[:notice] = t(:account_was_successfully_updated)
      redirect_to managers_accounts_path
    else
      render :edit
    end
  end

  private
  def account_params
    params.require(:account).permit(
      :name,
      :domain,
      :plan_id,
      :logo,
      :website,
      :stripe_customer_id,
      :stripe_customer,
      :active,
    )
  end

end


