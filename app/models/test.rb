class Test < ActiveRecord::Base
  belongs_to :account
  belongs_to :user
  has_many :questions

  validates :name, presence: true

  def shuffle_questions
    questions.shuffle()
  end
end
