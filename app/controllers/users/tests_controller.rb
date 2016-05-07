class Users::TestsController < UserController
  expose(:tests){ current_account.tests.order('ID DESC') }
  expose(:test, attributes: :test_params)

  def show
    render layout: false
  end

  def create
    test.account = current_account
    test.user = current_user
    if test.save
      flash[:notice] = t(:test_was_successfully_created)
      redirect_to users_tests_path
    else
      render :new
    end
  end

  def update
    if test.save
      flash[:notice] = t(:test_was_successfully_updated)
      redirect_to users_tests_path
    else
      render :edit
    end
  end

  private
  def test_params
    params.require(:test).permit(
      :name,
    )
  end

end
