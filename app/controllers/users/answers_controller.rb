class Users::AnswersController < UserController
  expose(:test){ current_account.tests.find(params[:test_id]) }
  expose(:question){ test.questions.find(params[:question_id]) }
  expose(:answers){ question.answers.order('ID DESC') }
  expose(:answer, attributes: :answer_params)

  def create
    answer.question = question
    if answer.save
      flash[:notice] = t(:answer_was_successfully_created)
      redirect_to users_test_question_answers_path(test, question)
    else
      render :new
    end
  end

  def update
    if answer.save
      flash[:notice] = t(:test_was_successfully_updated)
      redirect_to users_test_question_answers_path(test, question)
    else
      render :edit
    end
  end

  private
  def answer_params
    params.require(:answer).permit(
      :name,
      :photo,
      :is_correct,
    )
  end
end

