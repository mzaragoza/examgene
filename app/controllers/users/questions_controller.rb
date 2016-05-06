class Users::QuestionsController < UserController
  expose(:test){ current_account.tests.find(params[:test_id]) }
  expose(:questions){ test.questions.order('ID DESC') }
  expose(:question, attributes: :question_params)

  def create
    question.test = test
    if question.save
      flash[:notice] = t(:question_was_successfully_created)
      redirect_to users_test_questions_path(test)
    else
      render :new
    end
  end

  def update
    if question.save
      flash[:notice] = t(:test_was_successfully_updated)
      redirect_to users_test_questions_path(test)
    else
      render :edit
    end
  end

  private
  def question_params
    params.require(:question).permit(
      :name,
    )
  end
end
