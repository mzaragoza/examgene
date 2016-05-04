class Managers::PlansController < ManagerController
  expose(:plans){ Plan.all.order('ID DESC') }
  expose(:plan, attributes: :plan_params)

  def create
    if plan.save
      flash[:notice] = t(:plan_was_successfully_created)
      redirect_to managers_plans_path
    else
      render :new
    end
  end

  def update
    if plan.save
      flash[:notice] = t(:plan_was_successfully_updated)
      redirect_to managers_plans_path
    else
      render :edit
    end
  end

  private
  def plan_params
    params.require(:plan).permit(
      :active,
      :featured,
      :name,
      :price,
      :slug,
    )
  end

end

