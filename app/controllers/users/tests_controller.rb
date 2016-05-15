class Users::TestsController < UserController
  expose(:tests){ current_account.tests.order('ID DESC') }
  expose(:test, attributes: :test_params)

  def show
    @questions = params[:user][:questions].to_i
    if @questions == 0
      @questions = test.questions.count
    end
    @tests = params[:user][:tests].to_i
    if @tests == 0
      @tests = 1
    end
    @randomize = params[:user][:randomize].to_s
    if @randomize == 'yes'
      @randomize = true
    else
      @randomize = false
    end

    render layout: false
  end

  def new
    @test = Test.new
    @test.questions.build
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

  def edit
    puts 'xxx'
    @test = test
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
      questions_attributes: [
        :name,
        :photo
      ]
    )
  end
end
