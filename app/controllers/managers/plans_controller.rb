require "stripe"
class Managers::PlansController < ManagerController
  expose(:plans){ Plan.all.order('ID DESC') }
  expose(:plan, attributes: :plan_params)

  def create
    if plan.save
      create_stripe_plan(plan)
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
  def create_stripe_plan(plan)
    unless Rails.env == 'test'
      Stripe.api_key = ENV['STRIPE_SECRET_KEY']

      # interval values [day, month, year, week, 3-month, 6-month]
      Stripe::Plan.create(
        amount: (plan.price.to_f * 100).to_i,
        interval: "month",
        name: plan.name,
        currency: "usd",
        id: plan.slug
      )
    end
  end

  def plan_params
    params.require(:plan).permit(
      :active,
      :description,
      :featured,
      :name,
      :price,
      :slug,
    )
  end

end

