class Test < ActiveRecord::Base
  belongs_to :account
  belongs_to :user
  has_many :questions

  validates :name, presence: true
  accepts_nested_attributes_for :questions

  def shuffle_questions
    questions.shuffle()
  end
end
