class Managers::ManagersController < ManagerController
  before_filter :check_password_submitted, :only => :update
  expose(:managers){ Manager.all.order('ID DESC') }
  expose(:manager, attributes: :manager_params)

  def create
    if manager.save
      flash[:notice] = t(:manager_was_successfully_created)
      redirect_to managers_managers_path
    else
      render :new
    end
  end

  def update
    if manager.save
      flash[:notice] = t(:manager_was_successfully_updated)
      sign_in(manager, :bypass => true) if manager == current_manager
      redirect_to managers_managers_path
    else
      render :edit
    end
  end

  private
  def check_password_submitted
    if params[:manager][:password].blank?
      params[:manager].delete("password")
      manager.updating_password = false
    else
      manager.updating_password = true
    end
  end

  def manager_params
    params.require(:manager).permit(
      :active ,
      :email ,
      :first_name ,
      :last_name ,
      :password ,
      :photo ,
    )
  end

end
class Managers::ManagersController < ManagerController
  before_filter :check_password_submitted, :only => :update
  expose(:managers){ Manager.all.order('ID DESC') }
  expose(:manager, attributes: :manager_params)

  def create
    if manager.save
      flash[:notice] = t(:manager_was_successfully_created)
      redirect_to managers_managers_path
    else
      render :new
    end
  end

  def update
    if manager.save
      flash[:notice] = t(:manager_was_successfully_updated)
      sign_in(manager, :bypass => true) if manager == current_manager
      redirect_to managers_managers_path
    else
      render :edit
    end
  end

  private
  def check_password_submitted
    if params[:manager][:password].blank?
      params[:manager].delete("password")
      manager.updating_password = false
    else
      manager.updating_password = true
    end
  end

  def manager_params
    params.require(:manager).permit(
      :active ,
      :email ,
      :first_name ,
      :last_name ,
      :password ,
      :photo ,
    )
  end

end
